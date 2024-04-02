# Issue

I am using tint2 as a panel/taskbar.
The panel is started after login with openbox, by running it from `~/.config/openbox/autostart`

All good for the most part, but sometimes, the tint2 process was crashing with a core dump.

This is the error I was getting from *journalctl*:

```
Apr 02 12:21:34 matrix systemd-coredump[1535]: [🡕] Process 1230 (tint2) of user 1000 dumped core.
                                               
                                               Stack trace of thread 1230:
                                               #0  0x000061d33e73ce5d on_change_systray (tint2 + 0x28e5d)
                                               #1  0x000061d33e73d1ea resize_systray (tint2 + 0x291ea)
                                               #2  0x000061d33e7462c0 relayout_fixed (tint2 + 0x322c0)
                                               #3  0x000061d33e746276 relayout_fixed (tint2 + 0x32276)
                                               #4  0x000061d33e73273e render_panel (tint2 + 0x1e73e)
                                               #5  0x000061d33e733c6f handle_panel_refresh (tint2 + 0x1fc6f)
                                               #6  0x000061d33e734968 run_tint2_event_loop (tint2 + 0x20968)
                                               #7  0x000061d33e734a35 tint2 (tint2 + 0x20a35)
                                               #8  0x000061d33e7270ae main (tint2 + 0x130ae)
                                               #9  0x0000719c99443cd0 n/a (libc.so.6 + 0x25cd0)
                                               #10 0x0000719c99443d8a __libc_start_main (libc.so.6 + 0x25d8a)
                                               #11 0x000061d33e727805 _start (tint2 + 0x13805)
                                               
                                               Stack trace of thread 1235:
                                               #0  0x0000719c9952488d syscall (libc.so.6 + 0x10688d)
                                               #1  0x0000719c99f65487 g_cond_wait (libglib-2.0.so.0 + 0xb4487)
                                               #2  0x0000719c99ed5454 n/a (libglib-2.0.so.0 + 0x24454)
                                               #3  0x0000719c99ed54bc g_async_queue_pop (libglib-2.0.so.0 + 0x244bc)
                                               #4  0x0000719c99b8ac48 n/a (libpangoft2-1.0.so.0 + 0x9c48)
                                               #5  0x0000719c99f39065 n/a (libglib-2.0.so.0 + 0x88065)
                                               #6  0x0000719c994a955a n/a (libc.so.6 + 0x8b55a)
                                               #7  0x0000719c99526a3c n/a (libc.so.6 + 0x108a3c)
                                               ELF object binary architecture: AMD x86-64

```

# Solution

The latest version of tint2 installed using pacman is `17.0.2`
The code repository for it is located here: https://gitlab.com/o9000/tint2

Tint2 is not maintained anymore by the original author and the last commit was on January 31 2022, with the message `freeze code`.
With this message it's fair to assume that the code won't receive any other updates.

I cloned the repository and compiled the binary, trying to find out what is causing the crash.
It appears that the issue is with the `skypeforlinux` icon. 
I am starting `skypeforlinux` right after tint2 process is started.

When `skypeforlinux` is not started, tint2 doesn't appear to have any problems.

---

I found another repository for tint2, which is still not maintained anymore, but it does have some updates to it compared to the original repository.

The repository can be found here: https://gitlab.com/nick87720z/tint2/
It's version is `17.1.3-8`

Here's how you can clone the code and compile it to binary:

```
git clone https://gitlab.com/nick87720z/tint2.git
cd tint2
git checkout 17.1.3
mkdir build
cd build
cmake ..
make -j4
```

Using the compiled binary found in the *tint2/build* solved the problem