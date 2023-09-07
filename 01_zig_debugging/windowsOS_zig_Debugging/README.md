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

## lanuch.json (WindowsOS)

- lldb는 안되는듯 ㅠㅠ c++ extensions깔고 해야함.

```

{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "cppdebug",
            "type": "cppvsdbg",
            "request": "launch",
            "program": "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
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
