(module $brain
    (import "env" "log" (func $log (param  i32) ))
    (import "env" "beginPath" (func $beginPath  ))
    (import "env" "rect" (func $rect (param  i32 i32 i32 i32) ))
    (import "env" "fill" (func $fill  ))
    (import "env" "logFloat" (func $logFloat (param  f32) ))
    (import "env" "text" (func $text (param  i32 i32 i32 i32) ))
    (import "env" "font" (func $font (param  i32) ))
    (import "env" "fillStyle" (func $fillStyle (param  i32) ))
    (import "env" "rand" (func $rand (param  i32 i32) (result i32)))
    (import "env" "writeLocalStorageInt" (func $writeLocalStorageInt (param  i32 i32) ))
    (import "env" "getLocalStorageInt" (func $getLocalStorageInt (param  i32) (result i32)))
    (memory (export "memory") 1)
    (data (i32.const 0) "Block #%d, Free: %c, %d Bytes")
    (data (i32.const 29) "8")
    (data (i32.const 30) "8_u")
    (data (i32.const 33) "DynamicList(length=%d, capacity=%d, tSize=%d, ptr=%d)")
    (data (i32.const 86) "Vec2(x=%d, y=%d)")
    (data (i32.const 102) "rgb(%d, %d, %d)")
    (data (i32.const 117) "highscore")
    (data (i32.const 126) "Spiel Pausiert")
    (data (i32.const 140) "Leertaste zum spielen")
    (data (i32.const 161) "Score: %d")
    (data (i32.const 170) "black")
    (data (i32.const 175) "white")
    (data (i32.const 180) "Highscore: %d")
    (data (i32.const 193) "50px arial")
    (data (i32.const 203) "right")
    (data (i32.const 208) "red")
    (data (i32.const 211) "90px arial")
    (data (i32.const 221) "center")
    (data (i32.const 227) "70px arial")
    (global $globals.memInitialized (export "globals.memInitialized") (mut i32) (i32.const 0))
    (func $__init_mem (export "__init_mem")  
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            global.get $globals.memInitialized

            i32.const 1
            i32.ne
            (if
                (then
                    i32.const 237
                    i32.const 0
                    i32.store
                    i32.const 1
                    global.set $globals.memInitialized

                )
                (else
                )
            )

        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $malloc (export "malloc") (param $len i32) (result i32)
        (local $heapStart i32)
        (local $numBlocks i32)
        (local $i i32)
        (local $blockPtr i32)
        (local $foundBlock i32)
        (local $isFree i32)
        (local $length i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            call $__init_mem
            i32.const 237
            local.set $heapStart

            local.get $heapStart

            i32.load
            local.set $numBlocks

            i32.const 0
            local.set $i

            local.get $heapStart

            i32.const 4
            i32.add
            local.set $blockPtr

            i32.const 0
            local.set $foundBlock

            local.get $i

            local.get $numBlocks

            i32.lt_s
            i32.const 0
            i32.ne
            (if
                (then
                    (loop $Globalmalloc0
                        local.get $blockPtr

                        i32.load
                        local.set $isFree

                        local.get $blockPtr

                        i32.const 4
                        i32.add
                        i32.load
                        local.set $length

                        local.get $isFree

                        local.get $length

                        local.get $len

                        i32.ge_s
                        i32.and
                        (if
                            (then
                                i32.const 1
                                local.set $foundBlock

                                local.get $numBlocks

                                local.set $i

                            )
                            (else
                                local.get $blockPtr

                                i32.const 8
                                i32.add
                                local.get $length

                                i32.add
                                local.set $blockPtr

                                local.get $i

                                i32.const 1
                                i32.add
                                local.set $i

                            )
                        )

                        local.get $i

                        local.get $numBlocks

                        i32.lt_s
                        i32.const 0
                        i32.ne
                        br_if $Globalmalloc0
                    )
                )
                (else )
                )
            local.get $foundBlock

            (if
                (then
                    local.get $blockPtr

                    i32.const 0
                    i32.store
                )
                (else
                    local.get $heapStart

                    local.get $numBlocks

                    i32.const 1
                    i32.add
                    i32.store
                    local.get $blockPtr

                    i32.const 0
                    i32.store
                    local.get $blockPtr

                    i32.const 4
                    i32.add
                    local.get $len

                    i32.store
                )
            )

            local.get $blockPtr

            i32.const 8
            i32.add
            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $free (export "free") (param $ptr i32) 
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            local.get $ptr

            i32.const 8
            i32.sub
            i32.const 1
            i32.store
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $dumpBlocks (export "dumpBlocks")  
        (local $heapStart i32)
        (local $numBlocks i32)
        (local $i i32)
        (local $blockPtr i32)
        (local $free i32)
        (local $format i32)
        (local $formatted i32)
        (local $isFree i32)
        (local $length i32)
        (local $savedSp i32)

                        (local $varargPtr0 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            call $__init_mem
            i32.const 237
            local.set $heapStart

            local.get $heapStart

            i32.load
            local.set $numBlocks

            i32.const 0
            local.set $i

            local.get $heapStart

            i32.const 4
            i32.add
            local.set $blockPtr

            i32.const 89
            local.set $free

            i32.const 0
            i32.const 29
            call $createStackString
            local.set $format

            i32.const 0
            local.set $formatted

            local.get $i

            local.get $numBlocks

            i32.lt_s
            i32.const 0
            i32.ne
            (if
                (then
                    (loop $GlobaldumpBlocks0
                        local.get $blockPtr

                        i32.load
                        local.set $isFree

                        local.get $blockPtr

                        i32.const 4
                        i32.add
                        i32.load
                        local.set $length

                        local.get $isFree

                        (if
                            (then
                                i32.const 89
                                local.set $free

                            )
                            (else
                                i32.const 78
                                local.set $free

                            )
                        )

                        local.get $format

                        i32.const 1024
                        i32.const 16
                        call $salloc
                        local.set $varargPtr0

                        local.get $varargPtr0
                        i32.const 3
                        i32.store

                        local.get $varargPtr0
                        i32.const 4
                        i32.add
                        local.get $i

                        i32.store

                        local.get $varargPtr0
                        i32.const 8
                        i32.add
                        local.get $free

                        i32.store

                        local.get $varargPtr0
                        i32.const 12
                        i32.add
                        local.get $length

                        i32.store

                        local.get $varargPtr0
                        call $logF
                        local.get $blockPtr

                        i32.const 8
                        i32.add
                        local.get $length

                        i32.add
                        local.set $blockPtr

                        local.get $i

                        i32.const 1
                        i32.add
                        local.set $i

                        local.get $i

                        local.get $numBlocks

                        i32.lt_s
                        i32.const 0
                        i32.ne
                        br_if $GlobaldumpBlocks0
                    )
                )
                (else )
                )
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (global $globals.stackPointer (export "globals.stackPointer") (mut i32) (i32.const 65536))
    (func $salloc (export "salloc") (param $size i32) (result i32)
        
        ;; function body
        (block $funBlock (result i32)
            global.get $globals.stackPointer

            local.get $size

            i32.sub
            global.set $globals.stackPointer

            global.get $globals.stackPointer

            br $funBlock
        )
        return
    )

    (func $restoreStack (export "restoreStack") (param $ptr i32) 
        
        ;; function body
        (block $funBlock 
            local.get $ptr

            global.set $globals.stackPointer

        )
        return
    )

    (func $getStackPtr (export "getStackPtr")  (result i32)
        
        ;; function body
        (block $funBlock (result i32)
            global.get $globals.stackPointer

            br $funBlock
        )
        return
    )

    (func $createStackString (export "createStackString") (param $ptr i32)(param $length i32) (result i32)
        (local $base i32)
        
        ;; function body
        (block $funBlock (result i32)
            local.get $length

            i32.const 4
            i32.add
            call $salloc
            local.set $base

            local.get $base

            local.get $length

            i32.store
            local.get $base

            i32.const 4
            i32.add
            local.get $ptr

            local.get $length

            memory.copy
            local.get $base

            br $funBlock
        )
        return
    )

    (func $stringAppend (export "stringAppend") (param $str i32)(param $writeIndex i32)(param $char i32) 
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            local.get $str

            i32.const 4
            i32.add
            local.get $writeIndex

            i32.add
            local.get $char

            i32.store8
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $stringReverse (export "stringReverse") (param $str i32) 
        (local $length i32)
        (local $temp i32)
        (local $start i32)
        (local $end i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            local.get $str

            i32.load
            local.set $length

            i32.const 0
            local.set $temp

            i32.const 0
            local.set $start

            local.get $length

            i32.const 1
            i32.sub
            local.set $end

            local.get $start

            local.get $end

            i32.lt_s
            i32.const 0
            i32.ne
            (if
                (then
                    (loop $GlobalstringReverse0
                        local.get $str

                        local.get $start

                        call $getChar
                        local.set $temp

                        local.get $str

                        local.get $start

                        local.get $str

                        local.get $end

                        call $getChar
                        call $stringAppend
                        local.get $str

                        local.get $end

                        local.get $temp

                        call $stringAppend
                        local.get $start

                        i32.const 1
                        i32.add
                        local.set $start

                        local.get $end

                        i32.const 1
                        i32.sub
                        local.set $end

                        local.get $start

                        local.get $end

                        i32.lt_s
                        i32.const 0
                        i32.ne
                        br_if $GlobalstringReverse0
                    )
                )
                (else )
                )
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $stringAppendString (export "stringAppendString") (param $original i32)(param $writeIndex i32)(param $toAppend i32) (result i32)
        (local $toAppendLength i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            local.get $toAppend

            i32.load
            local.set $toAppendLength

            local.get $original

            i32.const 4
            i32.add
            local.get $writeIndex

            i32.add
            local.get $toAppend

            i32.const 4
            i32.add
            local.get $toAppendLength

            memory.copy
            local.get $toAppendLength

            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $strChangeLength (export "strChangeLength") (param $str i32)(param $length i32) 
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            local.get $str

            local.get $length

            i32.store
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $getChar (export "getChar") (param $str i32)(param $idx i32) (result i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            local.get $str

            i32.const 4
            i32.add
            local.get $idx

            i32.add
            i32.load8_u
            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $numToString (export "numToString") (param $number i32)(param $result i32) (result i32)
        (local $n i32)
        (local $pos i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            local.get $number

            i32.const 0
            i32.eq
            (if
                (then
                    local.get $result

                    i32.const 0
                    i32.const 48
                    call $stringAppend
                    local.get $result

                    i32.const 1
                    call $strChangeLength
                    local.get $result

                    br $funBlock
                )
                (else
                )
            )

            local.get $number

            local.set $n

            i32.const 0
            local.set $pos

            local.get $n

            i32.const 0
            i32.gt_s
            i32.const 0
            i32.ne
            (if
                (then
                    (loop $GlobalnumToString0
                        local.get $result

                        local.get $pos

                        local.get $n

                        i32.const 10
                        i32.rem_s
                        i32.const 48
                        i32.add
                        call $stringAppend
                        local.get $n

                        i32.const 10
                        i32.div_s
                        local.set $n

                        local.get $pos

                        i32.const 1
                        i32.add
                        local.set $pos

                        local.get $n

                        i32.const 0
                        i32.gt_s
                        i32.const 0
                        i32.ne
                        br_if $GlobalnumToString0
                    )
                )
                (else )
                )
            local.get $result

            local.get $pos

            call $strChangeLength
            local.get $result

            call $stringReverse
            local.get $result

            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $_sprintf (export "_sprintf") (param $str i32)(param $result i32)(param $varargPtr i32) 
        (local $counter i32)
        (local $lastChar i32)
        (local $writePtr i32)
        (local $addedChars i32)
        (local $strToAdd i32)
        (local $charToAdd i32)
        (local $strLen i32)
        (local $numVarargs i32)
        (local $char i32)
        (local $writeCurrentChar i32)
        (local $numberToAdd i32)
        (local $resultBuffer i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            i32.const 0
            local.set $counter

            i32.const -1
            local.set $lastChar

            i32.const 0
            local.set $writePtr

            i32.const 0
            local.set $addedChars

            i32.const 0
            local.set $strToAdd

            i32.const 32
            local.set $charToAdd

            local.get $str

            i32.load
            local.set $strLen

            local.get $varargPtr

            i32.load
            local.set $numVarargs

            local.get $varargPtr

            i32.const 4
            i32.add
            local.set $varargPtr

            i32.const 0
            local.set $counter

            local.get $counter

            local.get $strLen

            i32.lt_s
            i32.const 0
            i32.ne
            (if
                (then
                    (loop $Global_sprintf0
                        local.get $str

                        local.get $counter

                        call $getChar
                        local.set $char

                        i32.const 1
                        local.set $writeCurrentChar

                        local.get $lastChar

                        i32.const 37
                        i32.eq
                        (if
                            (then
                                local.get $char

                                i32.const 115
                                i32.eq
                                (if
                                    (then
                                        local.get $writePtr

                                        i32.const 1
                                        i32.sub
                                        local.set $writePtr

                                        i32.const 0
                                        local.set $writeCurrentChar

                                        local.get $varargPtr

                                        i32.load
                                        local.set $strToAdd

                                        local.get $result

                                        local.get $writePtr

                                        local.get $strToAdd

                                        call $stringAppendString
                                        local.set $addedChars

                                        local.get $varargPtr

                                        i32.const 4
                                        i32.add
                                        local.set $varargPtr

                                        local.get $writePtr

                                        local.get $addedChars

                                        i32.const 1
                                        i32.sub
                                        i32.add
                                        local.set $writePtr

                                    )
                                    (else
                                    )
                                )

                                local.get $char

                                i32.const 99
                                i32.eq
                                (if
                                    (then
                                        local.get $writePtr

                                        i32.const 1
                                        i32.sub
                                        local.set $writePtr

                                        i32.const 0
                                        local.set $writeCurrentChar

                                        local.get $varargPtr

                                        i32.load
                                        local.set $charToAdd

                                        local.get $result

                                        local.get $writePtr

                                        local.get $charToAdd

                                        call $stringAppend
                                        local.get $varargPtr

                                        i32.const 4
                                        i32.add
                                        local.set $varargPtr

                                    )
                                    (else
                                    )
                                )

                                local.get $char

                                i32.const 100
                                i32.eq
                                (if
                                    (then
                                        local.get $writePtr

                                        i32.const 1
                                        i32.sub
                                        local.set $writePtr

                                        i32.const 0
                                        local.set $writeCurrentChar

                                        local.get $varargPtr

                                        i32.load
                                        local.set $numberToAdd

                                        i32.const 0
                                        i32.const 32
                                        call $createStackString
                                        local.set $resultBuffer

                                        local.get $numberToAdd

                                        local.get $resultBuffer

                                        call $numToString
                                        local.set $strToAdd

                                        local.get $result

                                        local.get $writePtr

                                        local.get $strToAdd

                                        call $stringAppendString
                                        local.set $addedChars

                                        local.get $varargPtr

                                        i32.const 4
                                        i32.add
                                        local.set $varargPtr

                                        local.get $writePtr

                                        local.get $addedChars

                                        i32.const 1
                                        i32.sub
                                        i32.add
                                        local.set $writePtr

                                    )
                                    (else
                                    )
                                )

                            )
                            (else
                            )
                        )

                        local.get $writeCurrentChar

                        (if
                            (then
                                local.get $result

                                local.get $writePtr

                                local.get $char

                                call $stringAppend
                            )
                            (else
                            )
                        )

                        local.get $writePtr

                        i32.const 1
                        i32.add
                        local.set $writePtr

                        local.get $char

                        local.set $lastChar

                        local.get $counter

                        i32.const 1
                        i32.add
                        local.set $counter

                        local.get $counter

                        local.get $strLen

                        i32.lt_s
                        i32.const 0
                        i32.ne
                        br_if $Global_sprintf0
                    )
                )
                (else )
                )
            local.get $result

            local.get $writePtr

            call $strChangeLength
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $sprintf (export "sprintf") (param $format i32)(param $result i32)(param $vararg i32) 
        (local $varargPtr i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            local.get $vararg

            local.set $varargPtr

            local.get $format

            local.get $result

            local.get $varargPtr

            call $_sprintf
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $logF (export "logF") (param $format i32)(param $bufferSize i32)(param $vararg i32) 
        (local $varargPtr i32)
        (local $stringBuffer i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            local.get $vararg

            local.set $varargPtr

            i32.const 0
            local.get $bufferSize

            call $createStackString
            local.set $stringBuffer

            local.get $format

            local.get $stringBuffer

            local.get $varargPtr

            call $_sprintf
            local.get $stringBuffer

            call $log
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $DynamicList.alloc (export "DynamicList.alloc") (param $this i32)(param $tSize i32)(param $capacity i32) 
        (local $savedSp i32)

            (local $temp1 i32)
            (local $temp2 i32)
            (local $temp3 i32)
            (local $temp4 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            local.get $tSize

            ;; setStruct this.tSize (offset: 8)
            local.set $temp1

            local.get $this
            i32.const 8
            i32.add
            
            local.get $temp1
            i32.store
            ;; endSetStruct
            i32.const 0
            ;; setStruct this.length (offset: 0)
            local.set $temp2

            local.get $this
            
            local.get $temp2
            i32.store
            ;; endSetStruct
            local.get $capacity

            ;; setStruct this.capacity (offset: 4)
            local.set $temp3

            local.get $this
            i32.const 4
            i32.add
            
            local.get $temp3
            i32.store
            ;; endSetStruct
            local.get $capacity

            ;; get this.tSize (offset: 8), datatype: Integer
            local.get $this
            i32.const 8
            i32.add
            i32.load
            i32.mul
            call $malloc
            ;; setStruct this.ptr (offset: 12)
            local.set $temp4

            local.get $this
            i32.const 12
            i32.add
            
            local.get $temp4
            i32.store
            ;; endSetStruct
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $DynamicList.clear (export "DynamicList.clear") (param $this i32) 
        (local $savedSp i32)

            (local $temp5 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            i32.const 0
            ;; setStruct this.length (offset: 0)
            local.set $temp5

            local.get $this
            
            local.get $temp5
            i32.store
            ;; endSetStruct
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $DynamicList.realloc (export "DynamicList.realloc") (param $this i32) 
        (local $newCapacity i32)
        (local $newPtr i32)
        (local $savedSp i32)

            (local $temp6 i32)
            (local $temp7 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            ;; get this.length (offset: 0), datatype: Integer
            local.get $this
            i32.load
            ;; get this.capacity (offset: 4), datatype: Integer
            local.get $this
            i32.const 4
            i32.add
            i32.load
            i32.lt_s
            (if
                (then
                    br $funBlock
                )
                (else
                )
            )

            ;; get this.capacity (offset: 4), datatype: Integer
            local.get $this
            i32.const 4
            i32.add
            i32.load
            i32.const 2
            i32.mul
            local.set $newCapacity

            local.get $newCapacity

            ;; get this.tSize (offset: 8), datatype: Integer
            local.get $this
            i32.const 8
            i32.add
            i32.load
            i32.mul
            call $malloc
            local.set $newPtr

            local.get $newPtr

            ;; get this.ptr (offset: 12), datatype: Integer
            local.get $this
            i32.const 12
            i32.add
            i32.load
            ;; get this.capacity (offset: 4), datatype: Integer
            local.get $this
            i32.const 4
            i32.add
            i32.load
            ;; get this.tSize (offset: 8), datatype: Integer
            local.get $this
            i32.const 8
            i32.add
            i32.load
            i32.mul
            memory.copy
            ;; get this.ptr (offset: 12), datatype: Integer
            local.get $this
            i32.const 12
            i32.add
            i32.load
            call $free
            local.get $newCapacity

            ;; setStruct this.capacity (offset: 4)
            local.set $temp6

            local.get $this
            i32.const 4
            i32.add
            
            local.get $temp6
            i32.store
            ;; endSetStruct
            local.get $newPtr

            ;; setStruct this.ptr (offset: 12)
            local.set $temp7

            local.get $this
            i32.const 12
            i32.add
            
            local.get $temp7
            i32.store
            ;; endSetStruct
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $DynamicList.push (export "DynamicList.push") (param $this i32)(param $ptr i32) 
        (local $pushPtr i32)
        (local $savedSp i32)

            (local $temp8 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            ;; get this.ptr (offset: 12), datatype: Integer
            local.get $this
            i32.const 12
            i32.add
            i32.load
            ;; get this.length (offset: 0), datatype: Integer
            local.get $this
            i32.load
            ;; get this.tSize (offset: 8), datatype: Integer
            local.get $this
            i32.const 8
            i32.add
            i32.load
            i32.mul
            i32.add
            local.set $pushPtr

            local.get $pushPtr

            local.get $ptr

            ;; get this.tSize (offset: 8), datatype: Integer
            local.get $this
            i32.const 8
            i32.add
            i32.load
            memory.copy
            ;; get this.length (offset: 0), datatype: Integer
            local.get $this
            i32.load
            i32.const 1
            i32.add
            ;; setStruct this.length (offset: 0)
            local.set $temp8

            local.get $this
            
            local.get $temp8
            i32.store
            ;; endSetStruct
            local.get $this

            call $DynamicList.realloc
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $DynamicList.pop (export "DynamicList.pop") (param $this i32) 
        (local $savedSp i32)

                    (local $temp9 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            ;; get this.length (offset: 0), datatype: Integer
            local.get $this
            i32.load
            i32.const 0
            i32.gt_s
            (if
                (then
                    ;; get this.length (offset: 0), datatype: Integer
                    local.get $this
                    i32.load
                    i32.const 1
                    i32.sub
                    ;; setStruct this.length (offset: 0)
                    local.set $temp9

                    local.get $this
                    
                    local.get $temp9
                    i32.store
                    ;; endSetStruct
                )
                (else
                )
            )

        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $DynamicList.add (export "DynamicList.add") (param $this i32)(param $idx i32)(param $ptr i32) 
        (local $copySize i32)
        (local $savedSp i32)

            (local $temp10 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            ;; get this.length (offset: 0), datatype: Integer
            local.get $this
            i32.load
            local.get $idx

            i32.sub
            ;; get this.tSize (offset: 8), datatype: Integer
            local.get $this
            i32.const 8
            i32.add
            i32.load
            i32.mul
            local.set $copySize

            local.get $this

            local.get $idx

            i32.const 1
            i32.add
            call $DynamicList.get
            local.get $this

            local.get $idx

            call $DynamicList.get
            local.get $copySize

            memory.copy
            local.get $this

            local.get $idx

            call $DynamicList.get
            local.get $ptr

            ;; get this.tSize (offset: 8), datatype: Integer
            local.get $this
            i32.const 8
            i32.add
            i32.load
            memory.copy
            ;; get this.length (offset: 0), datatype: Integer
            local.get $this
            i32.load
            i32.const 1
            i32.add
            ;; setStruct this.length (offset: 0)
            local.set $temp10

            local.get $this
            
            local.get $temp10
            i32.store
            ;; endSetStruct
            local.get $this

            call $DynamicList.realloc
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $DynamicList.getLength (export "DynamicList.getLength") (param $this i32) (result i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            ;; get this.length (offset: 0), datatype: Integer
            local.get $this
            i32.load
            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $DynamicList.get (export "DynamicList.get") (param $this i32)(param $n i32) (result i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            ;; get this.ptr (offset: 12), datatype: Integer
            local.get $this
            i32.const 12
            i32.add
            i32.load
            local.get $n

            ;; get this.tSize (offset: 8), datatype: Integer
            local.get $this
            i32.const 8
            i32.add
            i32.load
            i32.mul
            i32.add
            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $DynamicList.log (export "DynamicList.log") (param $this i32) 
        (local $savedSp i32)

            (local $varargPtr11 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            i32.const 33
            i32.const 53
            call $createStackString
            i32.const 100
            i32.const 20
            call $salloc
            local.set $varargPtr11

            local.get $varargPtr11
            i32.const 4
            i32.store

            local.get $varargPtr11
            i32.const 4
            i32.add
            ;; get this.length (offset: 0), datatype: Integer
            local.get $this
            i32.load
            i32.store

            local.get $varargPtr11
            i32.const 8
            i32.add
            ;; get this.capacity (offset: 4), datatype: Integer
            local.get $this
            i32.const 4
            i32.add
            i32.load
            i32.store

            local.get $varargPtr11
            i32.const 12
            i32.add
            ;; get this.tSize (offset: 8), datatype: Integer
            local.get $this
            i32.const 8
            i32.add
            i32.load
            i32.store

            local.get $varargPtr11
            i32.const 16
            i32.add
            ;; get this.ptr (offset: 12), datatype: Integer
            local.get $this
            i32.const 12
            i32.add
            i32.load
            i32.store

            local.get $varargPtr11
            call $logF
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (global $globals.appleList (export "globals.appleList") (mut i32) (i32.const 0))
    (global $globals.snakeList (export "globals.snakeList") (mut i32) (i32.const 0))
    (global $globals.velocity (export "globals.velocity") (mut i32) (i32.const 0))
    (global $globals.DEFAULT_CAPACITY (export "globals.DEFAULT_CAPACITY") i32 (i32.const 2))
    (global $globals.last (export "globals.last") (mut f32) (f32.const 0))
    (global $globals.timer (export "globals.timer") (mut f32) (f32.const 0))
    (global $globals.WIDTH (export "globals.WIDTH") i32 (i32.const 30))
    (global $globals.HEIGHT (export "globals.HEIGHT") i32 (i32.const 20))
    (global $globals.gameState (export "globals.gameState") (mut i32) (i32.const 0))
    (global $globals.resetOnUnpause (export "globals.resetOnUnpause") (mut i32) (i32.const 0))
    (global $globals.headerText (export "globals.headerText") (mut i32) (i32.const 0))
    (global $globals.bottomText (export "globals.bottomText") (mut i32) (i32.const 0))
    (global $globals.highScore (export "globals.highScore") (mut i32) (i32.const 0))
    (func $Vec2.log (export "Vec2.log") (param $this i32) 
        (local $savedSp i32)

            (local $varargPtr12 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            i32.const 86
            i32.const 16
            call $createStackString
            i32.const 15
            i32.const 12
            call $salloc
            local.set $varargPtr12

            local.get $varargPtr12
            i32.const 2
            i32.store

            local.get $varargPtr12
            i32.const 4
            i32.add
            ;; get this.x (offset: 0), datatype: Integer
            local.get $this
            i32.load
            i32.store

            local.get $varargPtr12
            i32.const 8
            i32.add
            ;; get this.y (offset: 4), datatype: Integer
            local.get $this
            i32.const 4
            i32.add
            i32.load
            i32.store

            local.get $varargPtr12
            call $logF
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $Vec2.equals (export "Vec2.equals") (param $this i32)(param $other i32) (result i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            ;; get other.x (offset: 0), datatype: Integer
            local.get $other
            i32.load
            ;; get this.x (offset: 0), datatype: Integer
            local.get $this
            i32.load
            i32.eq
            ;; get other.y (offset: 4), datatype: Integer
            local.get $other
            i32.const 4
            i32.add
            i32.load
            ;; get this.y (offset: 4), datatype: Integer
            local.get $this
            i32.const 4
            i32.add
            i32.load
            i32.eq
            i32.and
            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $intLerp (export "intLerp") (param $a i32)(param $b i32)(param $num i32)(param $denom i32) (result i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            local.get $a

            local.get $num

            local.get $b

            local.get $a

            i32.sub
            i32.mul
            local.get $denom

            i32.div_s
            i32.add
            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $Color.lerp (export "Color.lerp") (param $this i32)(param $other i32)(param $num i32)(param $denom i32) (result i32)
        (local $newColor i32)
        (local $savedSp i32)

            (local $temp13 i32)
            (local $temp14 i32)
            (local $temp15 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            i32.const 12
            call $malloc
            local.set $newColor

            ;; get this.r (offset: 0), datatype: Integer
            local.get $this
            i32.load
            ;; get other.r (offset: 0), datatype: Integer
            local.get $other
            i32.load
            local.get $num

            local.get $denom

            call $intLerp
            ;; setStruct newColor.r (offset: 0)
            local.set $temp13

            local.get $newColor
            
            local.get $temp13
            i32.store
            ;; endSetStruct
            ;; get this.g (offset: 4), datatype: Integer
            local.get $this
            i32.const 4
            i32.add
            i32.load
            ;; get other.g (offset: 4), datatype: Integer
            local.get $other
            i32.const 4
            i32.add
            i32.load
            local.get $num

            local.get $denom

            call $intLerp
            ;; setStruct newColor.g (offset: 4)
            local.set $temp14

            local.get $newColor
            i32.const 4
            i32.add
            
            local.get $temp14
            i32.store
            ;; endSetStruct
            ;; get this.b (offset: 8), datatype: Integer
            local.get $this
            i32.const 8
            i32.add
            i32.load
            ;; get other.b (offset: 8), datatype: Integer
            local.get $other
            i32.const 8
            i32.add
            i32.load
            local.get $num

            local.get $denom

            call $intLerp
            ;; setStruct newColor.b (offset: 8)
            local.set $temp15

            local.get $newColor
            i32.const 8
            i32.add
            
            local.get $temp15
            i32.store
            ;; endSetStruct
            local.get $newColor

            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $Color.stringRep (export "Color.stringRep") (param $this i32) (result i32)
        (local $buffer i32)
        (local $savedSp i32)

            (local $varargPtr16 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            i32.const 0
            i32.const 25
            call $createStackString
            local.set $buffer

            i32.const 102
            i32.const 15
            call $createStackString
            local.get $buffer

            i32.const 16
            call $salloc
            local.set $varargPtr16

            local.get $varargPtr16
            i32.const 3
            i32.store

            local.get $varargPtr16
            i32.const 4
            i32.add
            ;; get this.r (offset: 0), datatype: Integer
            local.get $this
            i32.load
            i32.store

            local.get $varargPtr16
            i32.const 8
            i32.add
            ;; get this.g (offset: 4), datatype: Integer
            local.get $this
            i32.const 4
            i32.add
            i32.load
            i32.store

            local.get $varargPtr16
            i32.const 12
            i32.add
            ;; get this.b (offset: 8), datatype: Integer
            local.get $this
            i32.const 8
            i32.add
            i32.load
            i32.store

            local.get $varargPtr16
            call $sprintf
            local.get $buffer

            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (global $globals.snake (export "globals.snake") (mut i32) (i32.const 0))
    (func $randomizeApple (export "randomizeApple") (param $apple i32) 
        (local $savedSp i32)

            (local $temp17 i32)
            (local $temp18 i32)
                        (local $temp19 i32)
                        (local $temp20 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            i32.const 0
            global.get $globals.WIDTH

            i32.const 1
            i32.sub
            call $rand
            ;; setStruct apple.x (offset: 0)
            local.set $temp17

            local.get $apple
            
            local.get $temp17
            i32.store
            ;; endSetStruct
            i32.const 0
            global.get $globals.HEIGHT

            i32.const 1
            i32.sub
            call $rand
            ;; setStruct apple.y (offset: 4)
            local.set $temp18

            local.get $apple
            i32.const 4
            i32.add
            
            local.get $temp18
            i32.store
            ;; endSetStruct
            local.get $apple

            global.get $globals.snakeList

            call $isInList
            i32.const 0
            i32.ne
            (if
                (then
                    (loop $GlobalrandomizeApple0
                        i32.const 0
                        global.get $globals.WIDTH

                        i32.const 1
                        i32.sub
                        call $rand
                        ;; setStruct apple.x (offset: 0)
                        local.set $temp19

                        local.get $apple
                        
                        local.get $temp19
                        i32.store
                        ;; endSetStruct
                        i32.const 0
                        global.get $globals.HEIGHT

                        i32.const 1
                        i32.sub
                        call $rand
                        ;; setStruct apple.y (offset: 4)
                        local.set $temp20

                        local.get $apple
                        i32.const 4
                        i32.add
                        
                        local.get $temp20
                        i32.store
                        ;; endSetStruct
                        local.get $apple

                        global.get $globals.snakeList

                        call $isInList
                        i32.const 0
                        i32.ne
                        br_if $GlobalrandomizeApple0
                    )
                )
                (else )
                )
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $max (export "max") (param $a i32)(param $b i32) (result i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            local.get $a

            local.get $b

            i32.gt_s
            (if
                (then
                    local.get $a

                    br $funBlock
                )
                (else
                )
            )

            local.get $b

            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $main (export "main")  
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            i32.const 16
            call $malloc
            global.set $globals.snakeList

            i32.const 16
            call $malloc
            global.set $globals.appleList

            global.get $globals.snakeList

            i32.const 8
            i32.const 32
            call $DynamicList.alloc
            global.get $globals.appleList

            i32.const 8
            i32.const 32
            call $DynamicList.alloc
            i32.const 8
            call $malloc
            global.set $globals.velocity

            i32.const 25
            call $malloc
            global.set $globals.headerText

            i32.const 25
            call $malloc
            global.set $globals.bottomText

            call $reset
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $reset (export "reset")  
        (local $snakePos i32)
        (local $applePos i32)
        (local $savedSp i32)

            (local $object21 i32)
            (local $object22 i32)
            (local $temp23 i32)
            (local $temp24 i32)
            (local $varargPtr25 i32)
            (local $varargPtr26 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            i32.const 0
            global.set $globals.resetOnUnpause

            global.get $globals.snakeList

            call $DynamicList.clear
            global.get $globals.appleList

            call $DynamicList.clear
            ;; allocate $
            i32.const 8
            call $salloc
            local.set $object21
            ;; set $.x (offset 0)
                local.get $object21
                i32.const 1
                ;; test
                i32.store
            ;; end set $.x (offset 0)

            ;; set $.y (offset 4)
                local.get $object21
                i32.const 4
                i32.add
                i32.const 5
                ;; test
                i32.store
            ;; end set $.y (offset 4)

            local.get $object21
            local.set $snakePos

            global.get $globals.snakeList

            local.get $snakePos

            call $DynamicList.push
            ;; allocate $
            i32.const 8
            call $salloc
            local.set $object22
            ;; set $.x (offset 0)
                local.get $object22
                i32.const 15
                ;; test
                i32.store
            ;; end set $.x (offset 0)

            ;; set $.y (offset 4)
                local.get $object22
                i32.const 4
                i32.add
                i32.const 5
                ;; test
                i32.store
            ;; end set $.y (offset 4)

            local.get $object22
            local.set $applePos

            local.get $applePos

            call $randomizeApple
            global.get $globals.appleList

            local.get $applePos

            call $DynamicList.push
            i32.const 1
            ;; setStruct velocity.x (offset: 0)
            local.set $temp23

            global.get $globals.velocity
            
            local.get $temp23
            i32.store
            ;; endSetStruct
            i32.const 0
            ;; setStruct velocity.y (offset: 4)
            local.set $temp24

            global.get $globals.velocity
            i32.const 4
            i32.add
            
            local.get $temp24
            i32.store
            ;; endSetStruct
            i32.const 117
            i32.const 9
            call $createStackString
            call $getLocalStorageInt
            global.set $globals.highScore

            i32.const 126
            i32.const 14
            call $createStackString
            global.get $globals.headerText

            i32.const 8
            call $salloc
            local.set $varargPtr25

            local.get $varargPtr25
            i32.const 1
            i32.store

            local.get $varargPtr25
            i32.const 4
            i32.add
            i32.const 0
            i32.store

            local.get $varargPtr25
            call $sprintf
            i32.const 140
            i32.const 21
            call $createStackString
            global.get $globals.bottomText

            i32.const 8
            call $salloc
            local.set $varargPtr26

            local.get $varargPtr26
            i32.const 1
            i32.store

            local.get $varargPtr26
            i32.const 4
            i32.add
            i32.const 0
            i32.store

            local.get $varargPtr26
            call $sprintf
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $isInList (export "isInList") (param $point i32)(param $list i32) (result i32)
        (local $found i32)
        (local $i i32)
        (local $p i32)
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock (result i32)
            i32.const 0
            local.set $found

            i32.const 0
            local.set $i

            local.get $i

            local.get $list

            call $DynamicList.getLength
            i32.lt_s
            i32.const 0
            i32.ne
            (if
                (then
                    (loop $GlobalisInList0
                        local.get $list

                        local.get $i

                        call $DynamicList.get
                        local.set $p

                        local.get $point

                        local.get $p

                        call $Vec2.equals
                        (if
                            (then
                                i32.const 1
                                local.set $found

                                local.get $list

                                call $DynamicList.getLength
                                local.set $i

                            )
                            (else
                            )
                        )

                        local.get $i

                        i32.const 1
                        i32.add
                        local.set $i

                        local.get $i

                        local.get $list

                        call $DynamicList.getLength
                        i32.lt_s
                        i32.const 0
                        i32.ne
                        br_if $GlobalisInList0
                    )
                )
                (else )
                )
            local.get $found

            br $funBlock
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $move (export "move")  
        (local $head i32)
        (local $newHead i32)
        (local $foundApple i32)
        (local $i i32)
        (local $apple i32)
        (local $savedSp i32)

            (local $temp27 i32)
            (local $temp28 i32)
                    (local $temp29 i32)
                    (local $temp30 i32)
                    (local $temp31 i32)
                    (local $temp32 i32)
                    (local $varargPtr33 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            global.get $globals.snakeList

            i32.const 0
            call $DynamicList.get
            local.set $head

            i32.const 8
            call $malloc
            local.set $newHead

            ;; get head.x (offset: 0), datatype: Integer
            local.get $head
            i32.load
            ;; get velocity.x (offset: 0), datatype: Integer
            global.get $globals.velocity
            i32.load
            i32.add
            ;; setStruct newHead.x (offset: 0)
            local.set $temp27

            local.get $newHead
            
            local.get $temp27
            i32.store
            ;; endSetStruct
            ;; get head.y (offset: 4), datatype: Integer
            local.get $head
            i32.const 4
            i32.add
            i32.load
            ;; get velocity.y (offset: 4), datatype: Integer
            global.get $globals.velocity
            i32.const 4
            i32.add
            i32.load
            i32.add
            ;; setStruct newHead.y (offset: 4)
            local.set $temp28

            local.get $newHead
            i32.const 4
            i32.add
            
            local.get $temp28
            i32.store
            ;; endSetStruct
            ;; get newHead.x (offset: 0), datatype: Integer
            local.get $newHead
            i32.load
            global.get $globals.WIDTH

            i32.ge_s
            (if
                (then
                    i32.const 0
                    ;; setStruct newHead.x (offset: 0)
                    local.set $temp29

                    local.get $newHead
                    
                    local.get $temp29
                    i32.store
                    ;; endSetStruct
                )
                (else
                )
            )

            ;; get newHead.x (offset: 0), datatype: Integer
            local.get $newHead
            i32.load
            i32.const 0
            i32.lt_s
            (if
                (then
                    global.get $globals.WIDTH

                    ;; setStruct newHead.x (offset: 0)
                    local.set $temp30

                    local.get $newHead
                    
                    local.get $temp30
                    i32.store
                    ;; endSetStruct
                )
                (else
                )
            )

            ;; get newHead.y (offset: 4), datatype: Integer
            local.get $newHead
            i32.const 4
            i32.add
            i32.load
            global.get $globals.HEIGHT

            i32.ge_s
            (if
                (then
                    i32.const 0
                    ;; setStruct newHead.y (offset: 4)
                    local.set $temp31

                    local.get $newHead
                    i32.const 4
                    i32.add
                    
                    local.get $temp31
                    i32.store
                    ;; endSetStruct
                )
                (else
                )
            )

            ;; get newHead.y (offset: 4), datatype: Integer
            local.get $newHead
            i32.const 4
            i32.add
            i32.load
            i32.const 0
            i32.lt_s
            (if
                (then
                    global.get $globals.HEIGHT

                    ;; setStruct newHead.y (offset: 4)
                    local.set $temp32

                    local.get $newHead
                    i32.const 4
                    i32.add
                    
                    local.get $temp32
                    i32.store
                    ;; endSetStruct
                )
                (else
                )
            )

            local.get $newHead

            global.get $globals.snakeList

            call $isInList
            (if
                (then
                    i32.const 0
                    global.set $globals.gameState

                    i32.const 1
                    global.set $globals.resetOnUnpause

                    i32.const 117
                    i32.const 9
                    call $createStackString
                    global.get $globals.snakeList

                    call $DynamicList.getLength
                    call $writeLocalStorageInt
                    i32.const 161
                    i32.const 9
                    call $createStackString
                    global.get $globals.headerText

                    i32.const 8
                    call $salloc
                    local.set $varargPtr33

                    local.get $varargPtr33
                    i32.const 1
                    i32.store

                    local.get $varargPtr33
                    i32.const 4
                    i32.add
                    global.get $globals.snakeList

                    call $DynamicList.getLength
                    i32.store

                    local.get $varargPtr33
                    call $sprintf
                    br $funBlock
                )
                (else
                )
            )

            global.get $globals.snakeList

            i32.const 0
            local.get $newHead

            call $DynamicList.add
            i32.const 0
            local.set $foundApple

            i32.const 0
            local.set $i

            local.get $i

            global.get $globals.appleList

            call $DynamicList.getLength
            i32.lt_s
            i32.const 0
            i32.ne
            (if
                (then
                    (loop $Globalmove0
                        global.get $globals.appleList

                        local.get $i

                        call $DynamicList.get
                        local.set $apple

                        local.get $newHead

                        local.get $apple

                        call $Vec2.equals
                        (if
                            (then
                                local.get $apple

                                call $randomizeApple
                                i32.const 1
                                local.set $foundApple

                                global.get $globals.appleList

                                call $DynamicList.getLength
                                local.set $i

                            )
                            (else
                            )
                        )

                        local.get $i

                        i32.const 1
                        i32.add
                        local.set $i

                        local.get $i

                        global.get $globals.appleList

                        call $DynamicList.getLength
                        i32.lt_s
                        i32.const 0
                        i32.ne
                        br_if $Globalmove0
                    )
                )
                (else )
                )
            local.get $foundApple

            i32.const 0
            i32.eq
            (if
                (then
                    global.get $globals.snakeList

                    call $DynamicList.pop
                )
                (else
                )
            )

            local.get $newHead

            call $free
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $clear (export "clear") (param $cw i32)(param $ch i32) 
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            call $beginPath
            i32.const 170
            i32.const 5
            call $createStackString
            call $fillStyle
            i32.const 0
            i32.const 0
            local.get $cw

            local.get $ch

            call $rect
            call $fill
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $renderScore (export "renderScore") (param $cw i32)(param $ch i32) 
        (local $scoreText i32)
        (local $actualHighScore i32)
        (local $highScoreText i32)
        (local $savedSp i32)

            (local $varargPtr34 i32)
            (local $varargPtr35 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            i32.const 175
            i32.const 5
            call $createStackString
            call $fillStyle
            i32.const 25
            call $salloc
            local.set $scoreText

            i32.const 161
            i32.const 9
            call $createStackString
            local.get $scoreText

            i32.const 8
            call $salloc
            local.set $varargPtr34

            local.get $varargPtr34
            i32.const 1
            i32.store

            local.get $varargPtr34
            i32.const 4
            i32.add
            global.get $globals.snakeList

            call $DynamicList.getLength
            i32.store

            local.get $varargPtr34
            call $sprintf
            global.get $globals.highScore

            global.get $globals.snakeList

            call $DynamicList.getLength
            call $max
            local.set $actualHighScore

            i32.const 25
            call $salloc
            local.set $highScoreText

            i32.const 180
            i32.const 13
            call $createStackString
            local.get $highScoreText

            i32.const 8
            call $salloc
            local.set $varargPtr35

            local.get $varargPtr35
            i32.const 1
            i32.store

            local.get $varargPtr35
            i32.const 4
            i32.add
            local.get $actualHighScore

            i32.store

            local.get $varargPtr35
            call $sprintf
            i32.const 193
            i32.const 10
            call $createStackString
            call $font
            local.get $scoreText

            local.get $cw

            i32.const 10
            i32.sub
            i32.const 50
            i32.const 203
            i32.const 5
            call $createStackString
            call $text
            i32.const 193
            i32.const 10
            call $createStackString
            call $font
            local.get $highScoreText

            local.get $cw

            i32.const 10
            i32.sub
            i32.const 100
            i32.const 203
            i32.const 5
            call $createStackString
            call $text
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $renderRunning (export "renderRunning") (param $now f32)(param $cw i32)(param $ch i32) 
        (local $dt f32)
        (local $widthM i32)
        (local $heightM i32)
        (local $lightColor i32)
        (local $darkColor i32)
        (local $i i32)
        (local $color i32)
        (local $element i32)
        (local $apple i32)
        (local $savedSp i32)

            (local $object36 i32)
            (local $object37 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            local.get $now

            global.get $globals.last

            f32.sub
            local.set $dt

            global.get $globals.timer

            local.get $dt

            f32.add
            global.set $globals.timer

            local.get $cw

            global.get $globals.WIDTH

            i32.div_s
            local.set $widthM

            local.get $ch

            global.get $globals.HEIGHT

            i32.div_s
            local.set $heightM

            local.get $cw

            local.get $ch

            call $clear
            global.get $globals.timer

            f32.const 100
            f32.gt
            (if
                (then
                    call $move
                    f32.const 0
                    global.set $globals.timer

                )
                (else
                )
            )

            ;; allocate $
            i32.const 12
            call $salloc
            local.set $object36
            ;; set $.r (offset 0)
                local.get $object36
                i32.const 144
                ;; test
                i32.store
            ;; end set $.r (offset 0)

            ;; set $.g (offset 4)
                local.get $object36
                i32.const 4
                i32.add
                i32.const 237
                ;; test
                i32.store
            ;; end set $.g (offset 4)

            ;; set $.b (offset 8)
                local.get $object36
                i32.const 8
                i32.add
                i32.const 144
                ;; test
                i32.store
            ;; end set $.b (offset 8)

            local.get $object36
            local.set $lightColor

            ;; allocate $
            i32.const 12
            call $salloc
            local.set $object37
            ;; set $.r (offset 0)
                local.get $object37
                i32.const 0
                ;; test
                i32.store
            ;; end set $.r (offset 0)

            ;; set $.g (offset 4)
                local.get $object37
                i32.const 4
                i32.add
                i32.const 64
                ;; test
                i32.store
            ;; end set $.g (offset 4)

            ;; set $.b (offset 8)
                local.get $object37
                i32.const 8
                i32.add
                i32.const 40
                ;; test
                i32.store
            ;; end set $.b (offset 8)

            local.get $object37
            local.set $darkColor

            i32.const 0
            local.set $i

            local.get $i

            global.get $globals.snakeList

            call $DynamicList.getLength
            i32.lt_s
            i32.const 0
            i32.ne
            (if
                (then
                    (loop $GlobalrenderRunning0
                        call $beginPath
                        local.get $darkColor

                        local.get $lightColor

                        local.get $i

                        global.get $globals.snakeList

                        call $DynamicList.getLength
                        call $Color.lerp
                        local.set $color

                        global.get $globals.snakeList

                        local.get $i

                        call $DynamicList.get
                        local.set $element

                        local.get $color

                        call $Color.stringRep
                        call $fillStyle
                        ;; get element.x (offset: 0), datatype: Integer
                        local.get $element
                        i32.load
                        local.get $widthM

                        i32.mul
                        ;; get element.y (offset: 4), datatype: Integer
                        local.get $element
                        i32.const 4
                        i32.add
                        i32.load
                        local.get $heightM

                        i32.mul
                        local.get $widthM

                        local.get $heightM

                        call $rect
                        call $fill
                        local.get $color

                        call $free
                        local.get $i

                        i32.const 1
                        i32.add
                        local.set $i

                        local.get $i

                        global.get $globals.snakeList

                        call $DynamicList.getLength
                        i32.lt_s
                        i32.const 0
                        i32.ne
                        br_if $GlobalrenderRunning0
                    )
                )
                (else )
                )
            i32.const 0
            local.set $i

            local.get $i

            global.get $globals.appleList

            call $DynamicList.getLength
            i32.lt_s
            i32.const 0
            i32.ne
            (if
                (then
                    (loop $GlobalrenderRunning1
                        call $beginPath
                        global.get $globals.appleList

                        local.get $i

                        call $DynamicList.get
                        local.set $apple

                        i32.const 208
                        i32.const 3
                        call $createStackString
                        call $fillStyle
                        ;; get apple.x (offset: 0), datatype: Integer
                        local.get $apple
                        i32.load
                        local.get $widthM

                        i32.mul
                        ;; get apple.y (offset: 4), datatype: Integer
                        local.get $apple
                        i32.const 4
                        i32.add
                        i32.load
                        local.get $heightM

                        i32.mul
                        local.get $widthM

                        local.get $heightM

                        call $rect
                        call $fill
                        local.get $i

                        i32.const 1
                        i32.add
                        local.set $i

                        local.get $i

                        global.get $globals.appleList

                        call $DynamicList.getLength
                        i32.lt_s
                        i32.const 0
                        i32.ne
                        br_if $GlobalrenderRunning1
                    )
                )
                (else )
                )
            local.get $cw

            local.get $ch

            call $renderScore
            local.get $now

            global.set $globals.last

        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $renderPaused (export "renderPaused") (param $now f32)(param $cw i32)(param $ch i32) 
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            i32.const 175
            i32.const 5
            call $createStackString
            call $fillStyle
            i32.const 211
            i32.const 10
            call $createStackString
            call $font
            global.get $globals.headerText

            local.get $cw

            i32.const 2
            i32.div_s
            local.get $ch

            i32.const 2
            i32.div_s
            local.get $ch

            i32.const 8
            i32.div_s
            i32.sub
            i32.const 221
            i32.const 6
            call $createStackString
            call $text
            i32.const 227
            i32.const 10
            call $createStackString
            call $font
            global.get $globals.bottomText

            local.get $cw

            i32.const 2
            i32.div_s
            local.get $ch

            i32.const 2
            i32.div_s
            i32.const 221
            i32.const 6
            call $createStackString
            call $text
        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $render (export "render") (param $now f32)(param $cw i32)(param $ch i32) 
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            global.get $globals.gameState

            i32.const 0
            i32.eq
            (if
                (then
                    local.get $now

                    local.get $cw

                    local.get $ch

                    call $renderPaused
                )
                (else
                )
            )

            global.get $globals.gameState

            i32.const 1
            i32.eq
            (if
                (then
                    local.get $now

                    local.get $cw

                    local.get $ch

                    call $renderRunning
                )
                (else
                )
            )

        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $togglePause (export "togglePause")  
        (local $savedSp i32)
        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            global.get $globals.gameState

            i32.const 0
            i32.eq
            (if
                (then
                    global.get $globals.resetOnUnpause

                    (if
                        (then
                            call $reset
                        )
                        (else
                        )
                    )

                    i32.const 1
                    global.set $globals.gameState

                )
                (else
                    global.get $globals.gameState

                    i32.const 1
                    i32.eq
                    (if
                        (then
                            i32.const 0
                            global.set $globals.gameState

                        )
                        (else
                        )
                    )

                )
            )

        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

    (func $keyDown (export "keyDown") (param $charCode i32) 
        (local $savedSp i32)

                    (local $temp38 i32)
                    (local $temp39 i32)
                    (local $temp40 i32)
                    (local $temp41 i32)
                    (local $temp42 i32)
                    (local $temp43 i32)
                    (local $temp44 i32)
                    (local $temp45 i32)        
        ;; save sp
        call $getStackPtr
        local.set $savedSp
        ;; function body
        (block $funBlock 
            local.get $charCode

            i32.const 97
            i32.eq
            (if
                (then
                    ;; get velocity.x (offset: 0), datatype: Integer
                    global.get $globals.velocity
                    i32.load
                    i32.const 1
                    i32.eq
                    (if
                        (then
                            br $funBlock
                        )
                        (else
                        )
                    )

                    i32.const -1
                    ;; setStruct velocity.x (offset: 0)
                    local.set $temp38

                    global.get $globals.velocity
                    
                    local.get $temp38
                    i32.store
                    ;; endSetStruct
                    i32.const 0
                    ;; setStruct velocity.y (offset: 4)
                    local.set $temp39

                    global.get $globals.velocity
                    i32.const 4
                    i32.add
                    
                    local.get $temp39
                    i32.store
                    ;; endSetStruct
                )
                (else
                )
            )

            local.get $charCode

            i32.const 100
            i32.eq
            (if
                (then
                    ;; get velocity.x (offset: 0), datatype: Integer
                    global.get $globals.velocity
                    i32.load
                    i32.const -1
                    i32.eq
                    (if
                        (then
                            br $funBlock
                        )
                        (else
                        )
                    )

                    i32.const 1
                    ;; setStruct velocity.x (offset: 0)
                    local.set $temp40

                    global.get $globals.velocity
                    
                    local.get $temp40
                    i32.store
                    ;; endSetStruct
                    i32.const 0
                    ;; setStruct velocity.y (offset: 4)
                    local.set $temp41

                    global.get $globals.velocity
                    i32.const 4
                    i32.add
                    
                    local.get $temp41
                    i32.store
                    ;; endSetStruct
                )
                (else
                )
            )

            local.get $charCode

            i32.const 115
            i32.eq
            (if
                (then
                    ;; get velocity.y (offset: 4), datatype: Integer
                    global.get $globals.velocity
                    i32.const 4
                    i32.add
                    i32.load
                    i32.const -1
                    i32.eq
                    (if
                        (then
                            br $funBlock
                        )
                        (else
                        )
                    )

                    i32.const 0
                    ;; setStruct velocity.x (offset: 0)
                    local.set $temp42

                    global.get $globals.velocity
                    
                    local.get $temp42
                    i32.store
                    ;; endSetStruct
                    i32.const 1
                    ;; setStruct velocity.y (offset: 4)
                    local.set $temp43

                    global.get $globals.velocity
                    i32.const 4
                    i32.add
                    
                    local.get $temp43
                    i32.store
                    ;; endSetStruct
                )
                (else
                )
            )

            local.get $charCode

            i32.const 119
            i32.eq
            (if
                (then
                    ;; get velocity.y (offset: 4), datatype: Integer
                    global.get $globals.velocity
                    i32.const 4
                    i32.add
                    i32.load
                    i32.const 1
                    i32.eq
                    (if
                        (then
                            br $funBlock
                        )
                        (else
                        )
                    )

                    i32.const 0
                    ;; setStruct velocity.x (offset: 0)
                    local.set $temp44

                    global.get $globals.velocity
                    
                    local.get $temp44
                    i32.store
                    ;; endSetStruct
                    i32.const -1
                    ;; setStruct velocity.y (offset: 4)
                    local.set $temp45

                    global.get $globals.velocity
                    i32.const 4
                    i32.add
                    
                    local.get $temp45
                    i32.store
                    ;; endSetStruct
                )
                (else
                )
            )

            local.get $charCode

            i32.const 32
            i32.eq
            (if
                (then
                    call $togglePause
                )
                (else
                )
            )

        )
        ;; restore sp
        local.get $savedSp
        call $restoreStack
        return
    )

)