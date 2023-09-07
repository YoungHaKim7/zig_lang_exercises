# VScode ```lanuch.json``` & ```tasks.json``` 규칙

https://code.visualstudio.com/docs/editor/variables-reference

<hr>

# Zig Debug

1. VSCODE Extension 

```
CodeLLDB


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

<hr>

# macOS

## lanuch.json

```

{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "lldb",
            "request": "launch",
            "name": "Launch",
            "program": "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
            "args": [],
            "cwd": "${workspaceFolder}"
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

<hr>

# WindowsOS

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

<hr>

<br>
