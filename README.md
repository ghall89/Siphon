# Siphon

A GUI front-end for [yt-dlp](https://github.com/yt-dlp/yt-dlp), a tool for downloading videos from YouTube, written with Swift and SwiftUI.

## Installation

### Requirements

- An Intel or Apple Silicon Mac running MacOS 13 Ventura or later
- [Homebrew](https://brew.sh/) and [yt-dlp](https://formulae.brew.sh/formula/yt-dlp#default)

Note: If you install Siphon via Homebrew, yt-dlp will be automatically installed as a dependency.

### Homebrew

The suggested method for installing Siphon is through [Homebrew](https://brew.sh).

1. Add the 'ghall89/tap' tap with `brew tap ghall89/tap`
2. Install Siphon with `brew install --cask siphon`

Alternatively, you can [manually download](https://github.com/ghall89/Siphon/releases) the latest release of Siphon.

## Compile From Source

### Prerequisites

- MacOS 13+
- Xcode 14.3+
- An [Apple Developer Account](https://developer.apple.com)

### Instructions

1. Clone this repo with `git clone git@github.com:ghall89/Siphon.git`
2. Open `Siphon.xcodeproj` from the project directory
3. Wait for package dependencies to download
4. From the menubar, go to `Product → Archive`
5. When archive is complete, click `Distribute App` and select either `Direct Distribution` or `Custom` and follow the prompts

## License

MIT License

Copyright (c) 2024 Graham Hall

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
