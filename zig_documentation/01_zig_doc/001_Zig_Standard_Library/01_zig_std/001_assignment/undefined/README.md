# Result

- `zig run a001_assign_undefined.zig`

```bash
1⏎   
```

- undefined can be coerced to any type. Once this happens, it is no longer possible to detect that the value is undefined. undefined means the value could be anything, even something that is nonsense according to the type. Translated into English, undefined means "Not a meaningful value. Using this value would be a bug. The value will be unused, or overwritten before being used."
  - 정의되지 않은 값은 모든 유형에 강제할 수 있습니다. 이렇게 되면 더 이상 값이 정의되지 않았다는 것을 감지할 수 없습니다. 정의되지 않았다는 것은 값이 유형에 따라 말도 안 되는 값이 될 수 있음을 의미합니다. 영어로 번역하면 정의되지 않은 값은 "의미 있는 값이 아닙니다. 이 값을 사용하면 버그가 됩니다. 이 값은 사용하기 전에 사용되지 않거나 덮어쓰기됩니다." 
- In Debug mode, Zig writes 0xaa bytes to undefined memory. This is to catch bugs early, and to help detect use of undefined memory in a debugger. However, this behavior is only an implementation feature, not a language semantic, so it is not guaranteed to be observable to code.  
  - 디버그 모드에서 Zig는 정의되지 않은 메모리에 0xaa 바이트를 씁니다. 이는 버그를 조기에 발견하고 디버거에서 정의되지 않은 메모리를 사용하는 것을 감지하는 데 도움이 됩니다. 그러나 이 동작은 언어 의미가 아닌 구현 기능일 뿐이므로 코딩을 위해 관찰할 수 있는 것은 보장되지 않습니다
