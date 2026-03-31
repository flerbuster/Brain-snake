
const canvas = document.getElementById("glcanvas")
const ctx = canvas.getContext("2d")

let instance

const getString = (ptr) => {
  const mem = instance.exports.memory;
  const len = new DataView(mem.buffer).getInt32(ptr, true);
  const bytes = new Uint8Array(mem.buffer, ptr + 4, len);
  return new TextDecoder("utf-8").decode(bytes);
}

const imports = {
  env: {
    log: (str) => {
      console.log(getString(str))
    },
    logFloat: (float) => { console.log(float) },

    beginPath: () => { ctx.beginPath() },
    rect: (x, y, w, h) => { 
      ctx.rect(x, y, w, h)
    },
    fill: () => { ctx.fill() },

    font: (font) => {
      ctx.font = getString(font);
    },
    text: (str, x, y, align) => {
      ctx.textAlign = getString(align);
      ctx.fillText(getString(str), x, y);
    },

    fillStyle: (style) => {
      ctx.fillStyle = getString(style)
    },

    rand: (min, max) => {
      return Math.round(min + (Math.random() * (max - min)))
    },
    writeLocalStorageInt: (key, value) => {
      localStorage.setItem(getString(key), value)
    },
    getLocalStorageInt: (key) => {
      return +localStorage.getItem(getString(key))
    }
  },
};

(async () => {
  const module = await fetch('./brainsnake.wasm')
  const bytes = await module.arrayBuffer()
  const wasmModule = new WebAssembly.Module(bytes);
  instance = new WebAssembly.Instance(wasmModule, imports);
  instance.exports.main();

  requestAnimationFrame(render);

  
  window.addEventListener('keydown', e => {
    instance.exports.keyDown(e.key.charCodeAt(0));
  });
})()

const render = (now) => {
  instance.exports.render(now, canvas.width, canvas.height);

  requestAnimationFrame(render);
}


