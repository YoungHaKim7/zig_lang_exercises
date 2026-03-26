# link

<hr />

# (251128)zig -> github에서 codeberg로 이사[|🔝|](#link)
- https://codeberg.org/ziglang/zig
- # **[Zig, 메인 저장소를 GitHub에서 Codeberg로 이전](<https://news.hada.io/topic?id=24676&utm_source=discord&utm_medium=bot&utm_campaign=1480>)**
- **Zig 프로그래밍 언어 저장소**가 10년간 사용하던 GitHub를 떠나 **Codeberg로 이전**  
- GitHub의 **성능 저하와 버그**, 특히 **Actions의 불안정성과 방치**가 주요 원인  
- GitHub의 **AI 중심 정책**과 **Copilot 기능 강제 노출**이 Zig의 **‘no LLM / no AI’ 정책**과 충돌  
- **GitHub Sponsors**는 여전…

# 251204) **[Zig의 비동기 프로그램에 대한 새로운 계획](<https://news.hada.io/topic?id=24809&utm_source=discord&utm_medium=bot&utm_campaign=1480>)**[|🔝|](#link)
- **Zig 언어**가 기존 비동기 I/O 설계의 복잡성을 줄이기 위해 **새로운 `Io` 인터페이스 기반 모델**을 도입  
  - 이 모델은 **동기·비동기 코드의 구분 없이 동일한 함수 구조**를 유지하며, `Io.Threaded`와 `Io.Evented` 두 구현을 제공  
  - `Io.Threaded`는 기본적으로 **동기 실행**을, `Io.Evented`는 **이벤트 루…

<hr />

# zig에러 모음[|🔝|](#link)
- wsl1에서 에러나는 이유
  - 0.13에서 0.14로 넘어가면서 kernel최신 `syscalls`을 써서 wsl1에서는 zig 최신 버젼을 사용할 수 없다. ㅠㅠ
    - Zig 0.14.0 fails to compile hello world on WSL 1 #23153
    - https://github.com/ziglang/zig/issues/23153
      - In Zig 0.13.0, we formally required kernel version 4.19+, but didn't actually make use of any syscalls from that version.
      - In Zig 0.14.0, we started actually using newer `syscalls`, e.g. `statx`. It's quite possible that's what you're hitting here.
      - It is very unlikely that we'll make any effort to support `WSL 1` since it's emulating `a very old kernel version`, and it isn't even a 'real' Linux kernel underneath. Is there a reason you aren't just using WSL 2?

# 유튜브 외국 유튜버 자료 모음
- [(250911) Zig's new Reader and Writer interfaces (std.Io, 0.15.1) | ComputerBread](https://youtu.be/k74veXOMf4U?si=nxIDapKs8RnMCusW)

- [(250825) Zig 0.15.1 Release: Writergate, Async Removal, and 5x Faster Builds | Code With Cypert](https://youtu.be/zZWId9TsXY0?si=UNY233EHaWReOytP)
