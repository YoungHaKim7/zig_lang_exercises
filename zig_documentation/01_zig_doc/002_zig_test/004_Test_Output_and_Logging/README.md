# Result

```zig
const std = @import("std");

test "expectEqual demo" {
    const expected: i32 = 42;
    const actual = 42;

    // '동일성을 기대한다'는 첫 번째 논거는 알려진, 예상되는 결과입니다.
    // 두 번째 인수는 일부 표현의 결과입니다.
    // 실제 유형은 예상되는 유형에 따라 캐스팅됩니다.
    // The first argument to `expectEqual` is the known, expected, result.
    // The second argument is the result of some expression.
    // The actual's type is casted to the type of expected.
    try std.testing.expectEqual(expected, actual);
}

test "expectError demo" {
    const expected_error = error.DemoError;
    const actual_error_union: anyerror!void = error.DemoError;

    // 예상 오류'는 실제 오류가 예상 오류와 다를 때 실패합니다.
    // `expectError` will fail when the actual error is different than
    // the expected error.
    try std.testing.expectError(expected_error, actual_error_union);
}
```
