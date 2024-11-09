# Debugging(VSCode)
vscode:
	rm -rf .vscode
	mkdir -p .vscode
	echo '{' > .vscode/launch.json
	echo '    "version": "0.2.0",' >> .vscode/launch.json
	echo '    "configurations": [' >> .vscode/launch.json
	echo '        {' >> .vscode/launch.json
	echo '            "type": "lldb",' >> .vscode/launch.json
	echo '            "request": "launch",' >> .vscode/launch.json
	echo '            "name": "Launch",' >> .vscode/launch.json
	echo '            "program": "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",' >> .vscode/launch.json
	echo '            "args": [],' >> .vscode/launch.json
	echo '            "cwd": "${workspaceFolder}",' >> .vscode/launch.json
	echo '        }' >> .vscode/launch.json
	echo '    ]' >> .vscode/launch.json
	echo '}' >> .vscode/launch.json
	echo '{' > .vscode/tasks.json
	echo '  "version": "2.0.0",' >> .vscode/tasks.json
	echo '  "tasks": [' >> .vscode/tasks.json
	echo '      {' >> .vscode/tasks.json
	echo '          "label": "build",' >> .vscode/tasks.json
	echo '          "type": "shell",' >> .vscode/tasks.json
	echo '          "command": "zig build",' >> .vscode/tasks.json
	echo '          "group": "build",' >> .vscode/tasks.json
	echo '          "problemMatcher: [' >> .vscode/tasks.json
	echo '          "   "$gcc"' >> .vscode/tasks.json
	echo '          ]' >> .vscode/tasks.json
	echo '      }' >> .vscode/tasks.json
	echo '  ]' >> .vscode/tasks.json
	echo '},' >> .vscode/tasks.json
