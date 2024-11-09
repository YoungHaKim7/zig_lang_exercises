# Result

```zig
const std = @import("std");

test "expect addOne adds one to 41" {
    // 표준 라이브러리에는 테스트를 만드는 데 유용한 기능이 포함되어 있습니다. 'expect'는 해당 인수가 사실인지 확인하는 기능입니다.
    // 오류를 나타내는 인수가 거짓인 경우 오류를 반환합니다.
    // 'try'는 테스트 실패를 알리기 위해 테스트 러너에게 오류를 반환하는 데 사용됩니다.
    // The Standard Library contains useful functions to help create tests.
    // `expect` is a function that verifies its argument is true.
    // It will return an error if its argument is false to indicate a failure.
    // `try` is used to return an error to the test runner to notify it that the test failed.
    try std.testing.expect(addOne(41) == 42);
}

test addOne {
    // A test name can also be written using an identifier.
    // 식별자를 사용하여 테스트 이름을 쓸 수도 있습니다.
    // This is a doctest, and serves as documentation for `addOne`.
    // 이 문서는 'addOne'의 다큐멘테이션 역할을 합니다.
    try std.testing.expect(addOne(41) == 42);
}

/// 함수 'addOne'은 인수로 주어진 숫자에 1을 추가합니다.
/// The function `addOne` adds one to the number given as its argument.
fn addOne(number: i32) i32 {
    return number + 1;
}


```

- `zig test a001_testing_introduction.zig`

```bash
$ zig test a001_testing_introduction.zig
All 2 tests passed.

```
