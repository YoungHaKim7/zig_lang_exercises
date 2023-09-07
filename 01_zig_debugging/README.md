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