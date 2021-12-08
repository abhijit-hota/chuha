# Chuha - A Mouse Usage Tracker

A small, unoptimized and ugly `bash` and `awk` script to track your mouse and touchpad usage in X server environments. It works on Linux Mint and will probably work in other Ubuntu based distros. It runs in the background and writes daily usage into a file.

## Usage

1. Test whether you have `xinput`. If you're using the above mentioned distros, you'd probably have it.

    ```sh
    which xinput
    ```

2. Find out IDs of the devices you need to track.
    ```sh
    xinput list
    ```
3. Download the `chuha.sh` file in this repository.
4. ❗❗❗**Change the mouse and touchpad IDs to what you got from step 2**. If you want to track more devices, you have to copy the function. [^1]
5. Customise the output file paths if you want to. Default is `$HOME/.mouse/mouse_DD_MM_YY.txt`.
6. Run the file with
    ```sh
    sh ./chuha.sh & disown
    ```
**Optional**: Add the script to your startup programs.

Thanks!
____

[^1]: A PR is welcome which abstracts out the `awk` part and makes the script more generic to N number of devices.