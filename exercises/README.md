# zig code example

https://github.com/SpexGuy


# ziglearn

https://ziglearn.org/


<br>

# Zig Tutorial part 1

https://youtu.be/G170lsf551Q



# Zig Debug

1. VSCODE Extension 

```
C/C++ v1.13.9
Microsoft
C/C++ IntelliSense, debugging, and code browsing.

```

https://code.visualstudio.com/docs/languages/cpp


# .vscode setting

```
mkdir .vscode

cd .vscode

// linux OS
touch launch.json

touch tasks.json


// windows OS
echo $null >> launch.json

echo $null >> tasks.json


```

## lanuch.json

```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "cppdebug",
            "type": "cppvsdbg",
            "request": "launch",
            "program": "${workspaceFolder}/zig-out/bin/02_zig_debugging.exe",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "preLaunchTask": "build"
        }
    ]
}

```

## tasks.json

```

{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "build",
            "type": "shell",
            "command": "zig build",
            "group": "build",
            "problemMatcher": [
                "$gcc"
            ]
        }
    ]
}

```