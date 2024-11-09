const x = 1234;

fn foo() void {
    const y = 5678;

    y += 1;
}

pub fn main() void {
    foo();
}
