<p align="center">
	<img width=55px src="https://user-images.githubusercontent.com/67513038/178751011-806395c2-c3dc-4094-80da-5a9dc82f0782.png" />
</p>

<hr />

# link
- [zig-snippets정리중..](https://github.com/YoungHaKim7/zig-snippets)
- [zig playground](https://zig-play.dev/)
- [zig최신 뉴스](#zig최신-뉴스)
  - [(251128)zig -> github에서 codeberg로 이사](#251128zig---github에서-codeberg로-이사)
  - [(251204) Zig의 비동기 프로그램에 대한 새로운 계획](#251204-zig의-비동기-프로그램에-대한-새로운-계획)

<hr />

# zig최신 뉴스[|🔝|](#link)

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



# zig release build[|🔝|](#link)
- https://github.com/zigtools/zls

```
zig build -Doptimize=ReleaseSafe
```

# zig에러 모음[|🔝|](#link)
- wsl1에서 에러나는 이유
  - 0.13에서 0.14로 넘어가면서 kernel최신 `syscalls`을 써서 wsl1에서는 zig 최신 버젼을 사용할 수 없다. ㅠㅠ
    - Zig 0.14.0 fails to compile hello world on WSL 1 #23153
    - https://github.com/ziglang/zig/issues/23153
      - In Zig 0.13.0, we formally required kernel version 4.19+, but didn't actually make use of any syscalls from that version.
      - In Zig 0.14.0, we started actually using newer `syscalls`, e.g. `statx`. It's quite possible that's what you're hitting here.
      - It is very unlikely that we'll make any effort to support `WSL 1` since it's emulating `a very old kernel version`, and it isn't even a 'real' Linux kernel underneath. Is there a reason you aren't just using WSL 2?

# zig영상 모아보기(내가 공부하려고 만듬)[|🔝|](#link)
- https://youtube.com/playlist?list=PLcMveqN_07mbgfnYY9YIXo_Ls9FTSvDPx&si=5BwBs3uxkXolyOzb

  - [zig언어 100초 설명 | Fireship](https://youtu.be/kxT8-C1vmd4?si=b2VddFQ8jZvKqFnG)

<hr>

# Zig[|🔝|](#link)

- https://ziglang.org/
- codeberg https://codeberg.org/ziglang/zig
  - 뉴스출처 : https://ziglang.org/news/migrating-from-github-to-codeberg/

# Zig LSP (zls)[|🔝|](#link)

- codeberg로 이사함
  - https://codeberg.org/ska80/zls
- https://github.com/zigtools/zls

# Zig 문서 검색[|🔝|](#link)
- https://ziglang.org/learn/

# Zig Tutorial[|🔝|](#link)
- https://zig.guide/

<hr>

# zig(.gitignore)[|🔝|](#link)
- https://github.com/ziglang/zig/blob/master/.gitignore
```gitignore
# https://github.com/ziglang/zig/blob/master/.gitignore

.DS_Store

# This file is for zig-specific build artifacts.
# If you have OS-specific or editor-specific files to ignore,
# such as *.swp or .DS_Store, put those in your global
# ~/.gitignore and put this in your ~/.gitconfig:
#
# [core]
#     excludesfile = ~/.gitignore
#
# Cheers!
# -andrewrk

.zig-cache/
zig-out/
/release/
/debug/
/build/
/build-*/
/docgen_tmp/

# Although this was renamed to .zig-cache, let's leave it here for a few
# releases to make it less annoying to work with multiple branches.
zig-cache/
```

# Learning Zig basics, multi threading and sockets in 30 minutes! | CallousCoder

https://youtu.be/E-MPhgtC_2s?si=vvFLBWZrCRDBcmhS



# FLTK Zig: Basics(GUI)

https://youtu.be/D2ijlrDStdM


<hr>


# Awesome Zig[|🔝|](#link)

https://www.trackawesomelist.com/catdevnull/awesome-zig/readme/

## Ziglings

[https://github.com/ratfactor/ziglings](https://github.com/ratfactor/ziglings)

[답을 다 푼분이 있다. 역시 괴물이 많다. ㅋㅋㅋ ](https://git.adamu.jp/adam/ziglings)

- Welcome to Ziglings! This project contains a series of tiny broken programs. By fixing them, you'll learn how to read and write Zig code.

Those tiny broken programs need your help! (You'll also save the planet from evil aliens and help some friendly elephants stick together, which is very sweet of you.)

This project was directly inspired by the brilliant and fun rustlings project for the Rust language. Indirect inspiration comes from Ruby Koans and the Little LISPer/Little Schemer series of books.

## Intended Audience

This will probably be difficult if you've never programmed before. But no specific programming experience is required. And in particular, you are not expected to have any prior experience with "systems programming" or a "systems" level language such as C.

Each exercise is self-contained and self-explained. However, you're encouraged to also check out these Zig language resources for more detail:

- [https://ziglearn.org/](https://ziglearn.org/)
- [https://ziglang.org/documentation/master/](https://ziglang.org/documentation/master/)

  Also, the Zig community is incredibly friendly and helpful!

<br>

# Zig tutorial part1[|🔝|](#link)

[Zig Tutorial part 1 \_\_ Simon Clavet
](https://youtu.be/G170lsf551Q)

- https://www.openmymind.net/learning_zig/

- Zig 프로그래밍 언어 배우기 (openmymind.net)
https://news.hada.io/topic?id=11006&utm_source=discord&utm_medium=bot&utm_campaign=1480
Zig 설치하기
언어 개요
스타일 가이드
포인터
스택 메모리
힙 메모리 및 할당자
제네릭
Zig로 코딩하기

- Zig 프로그래밍 언어 배우기 (openmymind.net)
https://news.hada.io/topic?id=10938
Zig 설치하기
언어 개요
스타일 가이드
포인터
스택 메모리
힙 메모리 및 할당자
제네릭
Zig로 코딩하기




<br>

<hr>

# **[Zig의 comptime이 하지 않는 일들](<https://news.hada.io/topic?id=20446&utm_source=discord&utm_medium=bot&utm_campaign=1480>)**[|🔝|](#link)
- Zig의 **comptime** 기능은 매우 **강력한 컴파일 타임 평가 기능**을 제공하지만 **의도적으로 제한적**임  
- 컴파일 타임 코드 실행 시 **호스트 정보에 접근 불가능**, 크로스 컴파일에 적합한 설계임  
- **동적 코드 생성, DSL, RTTI, I/O 등은 지원하지 않음**, 대신 명시적인 타입 기반 코드 특수화 사용  

<hr />

<br>

# GlobalYoung Youtube[|🔝|](#link)

[(zig_lings)Global Young \_\_ zig languages exerciese](./zig_lings_example_QandA)

Zig Exercieses
[series](https://youtube.com/playlist?list=PLcMveqN_07mbgfnYY9YIXo_Ls9FTSvDPx)

- 1. hello zig, std, assignment

[한글지그Zig강의\_001_hello world_std_assignment_Zig Programming Language tutorial](https://youtu.be/JdbEJaWXVMA)

- 2. array

# Zig Language Exercises series[|🔝|](#link)

[한글지그Zig강의 \_\_ 모아 보기 Series Zig Language tutorial](https://youtube.com/playlist?list=PLcMveqN_07mbgfnYY9YIXo_Ls9FTSvDPx)

<br>

<hr>


