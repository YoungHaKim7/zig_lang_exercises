use std::io::{self, Write};

#[derive(Debug)]
struct User {
    id: u64,
}

fn get_user_details(user: &User) {
    println!("Fetched details for user id: {}", user.id);
}

fn get_user(id: u64) -> User {
    let user = User { id };
    get_user_details(&user);
    user
}

fn main() -> io::Result<()> {
    let user_res = get_user(64);

    eprintln!("All your {} are belong to us.", "codebase");
    println!("User print: id = {}", user_res.id);

    let stdout = io::stdout();
    let mut handle = io::BufWriter::new(stdout.lock());

    writeln!(handle, "Run `cargo test` to run the tests.")?;

    handle.flush()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn simple_test() {
        let mut list = Vec::new();
        list.push(42);
        assert_eq!(list.pop(), Some(42));
    }

    mod a01_fn_rust_lib {
        pub fn add(a: i32, b: i32) -> i32 {
            a + b
        }
    }

    #[test]
    fn use_other_module() {
        assert_eq!(150, a01_fn_rust_lib::add(100, 50));
    }

    #[test]
    fn fuzz_example() {
        fn test_one(input: &[u8]) {
            assert!(!input.eq(b"canyoufindme"));
        }

        // Example input to simulate fuzzing
        test_one(b"someinput");
    }
}
