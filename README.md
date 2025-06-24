Absolutely\! Here's the README in Markdown format, ready for you to copy and paste:

-----

# go2rtc-ffmpeg-debugger

This repository provides a simple setup to test `go2rtc` with `ffmpeg`, facilitating the debugging of camera stream issues.

-----

## Getting Started

To get started, clone the repository and run the setup script:

```bash
git clone <repository-url>
cd go2rtc-ffmpeg-debugger
./setup.sh
```

The `setup.sh` script will install **go2rtc** and **ffmpeg**, ensuring they are compatible with your system's architecture.

-----

## Usage

### Step 1: Run go2rtc

In your first terminal session, start `go2rtc` using the provided configuration file:

```bash
./go2rtc -config=go2rtc.yaml
```

This will launch `go2rtc` and make the streams defined in `go2rtc.yaml` available.

### Step 2: Run Tests with `test.sh`

In a separate terminal session, you can run `test.sh` to interact with the `go2rtc` streams. The `test.sh` script requires two arguments:

1.  **Stream Name:** The name of a stream as defined in your `go2rtc.yaml` file.
2.  **Mode:** One of `record`, `detect`, or `mixed`.
      * `record`: Records the stream using `ffmpeg`.
      * `detect`: Decodes the stream using `ffmpeg` (for detection purposes).
      * `mixed`: Performs both recording and decoding.

Here are some examples:

**Record a stream:**

```bash
./test.sh your_stream_name record
```

**Only decode a stream:**

```bash
./test.sh your_stream_name detect
```

**Record and decode a stream:**

```bash
./test.sh your_stream_name mixed
```

-----

## Configuration

The `go2rtc.yaml` file is where you define your camera streams. You'll need to modify this file to include your specific camera URLs and other **go2rtc** settings.

-----
