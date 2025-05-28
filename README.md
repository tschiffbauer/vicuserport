## 60kHz Digital Audio on the expanded Commodore VIC-20! 🤘

This is my version of a 60kHz digital sound player from the Commodore PET to my old Commodore VIC-20.

We're talking **pure, unadulterated digital audio straight from the User Port**, completely bypassing the VIC-20's usual sound chip. Why? Because we can!

## The Original Masterpiece (aka The PET's Glorious Distortion)

This whole crazy idea kicked off thanks to the genius over at Poking Technology, whose YouTube video, "[How to play 60kHz samples on an unmodified Commodore PET, poorly](http://www.youtube.com/watch?v=3SlRbYfyNRY)", sent ripples through my brain. They managed to coax 60kHz digital samples out of a PET's 6522 VIA chip's shift register. The result? A delightfully gritty, surprisingly high-sample-rate approximation of digital audio. It's not hi-fi, but it's pure and awesome.  I thought to myself, HEY, I bet the VIC-20 could do that!

## The VIC-20 Port: Wire-Tapping Our Way to Audio Glory! 🎧

Instead of just letting the poor little VIC-20 rely on its native VIC-I sound chip for its beautifuly simple bleeps and boops, I thought, "What if we make it do something *completely different*?"

This port is less about translating code line-for-line and more about channeling the PET's mad-scientist spirit directly into the VIC-20. I'm not using any fancy extra boards. Oh no. We're getting down and dirty, **tapping wires directly from the User Port!**

**Here's the secret sauce:**

* **Bypassing the Obvious:** Forget the VIC-I chip! I'm side-stepping it to explore alternative sound frontiers.
* **Unlocking the Native 6522 VIA's Hidden Talents:** The VIC-20's 6522 VIA chips will be used for its **shift register (SR)** and **timers** for raw digital output. 
* **DIY Audio Output: Get Your Wires Ready!** This isn't plug-and-play. You'll be connecting an external amplifier and speakers directly to the VIC-20's **User Port pins CB1 and CB2**. Yep, we're going old-school, hands-on, wire-tapping style! (Check out the [VIC-20 Programmer's Reference Guide, pages 230-233](https://archive.org/details/VIC-20ProgrammersReferenceGuide1stEdition6thPrinti/page/n247/mode/2up), for the low-down on those pins).
* **Register Rework:** All those PET-specific VIA register addresses? They've been meticulously remapped to the correct memory locations for the VIC-20's VIA.

**My Grand Goal:**

1.  To blast digital samples from the VIC-20 using its **6522 VIA**, showing off its surprising versatility.

**Current Status:**

It's alive! It's playing! It's a glorious work in progress. While it's not quite concert-hall quality (it's 1-bit, after all!), it's a fantastic demonstration of what you can squeeze out of this old beast. Future updates might include even more shenanigans, who knows?  I really need to work on this more so that it doesn't play garbage after the sample is done playing.  Now it does loop, so hey, close your ears for a few :)

[![The VIC-20 Can Do That?! 60kHz Digital Audio from the User Port!](https://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](https://www.youtube.com/watch?v=yz4WnrCbzFM)

**Repository Goodies:**

* `vic20cdaudio.asm`: The star of the show! 
* `README.md`: You're reading it! 
* `sound_short.a2stream`: The raw, bit-blasting audio data.

---

### **Let's Get This Party Started: Running the Code!**

**(Warning: May induce extreme feelings of what the heck)**

1.  **Gear Up! (The Hardware Checklist):**
    * Your trusty Commodore VIC-20 (of course!).
    * A **24KB RAM expansion** 
    * An **external amplifier and speakers** – because our 1-bit audio deserves to be heard!
    * And the most crucial part: **wires tapped directly from your VIC-20's User Port pins CB1 and CB2**. Here is how I did it:
  

2.  **Assemble Your Forces! (The Code Bit):**
    * You'll need **BeeBasm** to turn that glorious assembly code into a .prg file.

3.  **Load 'Er Up & Let 'Er Rip! (Execution Time):**
    * Transfer your freshly assembled `.prg` file to your VIC-20.  I'm not sure there is any way to use an emulator to hear this, so sorry...real hardware at this point :)

---

### **Credits (Where Credit's Due!):**

* **Original PET Inspiration & Awesomeness:** David Given (Poking Technology) - Seriously, go watch their video: [How to play 60kHz samples on an unmodified Commodore PET, poorly](http://www.youtube.com/watch?v=3SlRbYfyNRY)
* **VIC-20 Port ** Tony Schiffbauer - That's me! Also known as The REAL Tony Rocks!
