# Return_Of_The_Snake
Implemented the Retro SNAKE Game on Nexys4 DDR Artix 7 FPGA board using Verilog and displayed it onto a VGA compatible monitor.

## Abstract
This repo presents a fully hardware-implemented version of the classic Snake game, designed and synthesized entirely using Verilog HDL on the Nexys4 DDR Artix-7 FPGA platform. This project goes beyond simple game recreation—it serves as a foundational proof-of-concept for implementing core graphical processing functions in hardware, effectively acting as a minimalist GPU (Graphics Processing Unit) built from the ground up. By leveraging the deterministic, parallel-processing capabilities of FPGAs, this system simulates frame-based rendering, pixel scanning, dynamic object drawing, and text overlay functionalities—fundamentals that mirror operations performed within commercial GPUs. What makes this project particularly significant is its relevance in a landscape lacking widely accessible open-source GPU designs. Most commercial GPUs are proprietary and abstracted away from hardware-level access. This design demonstrates that FPGAs can bridge that gap, offering a tangible educational platform to explore low-level graphics processing, display timing, and peripheral interfacing.

In essence, Return of the Snake is not just a game—it is a compact, functional prototype of how FPGA-based systems can replicate essential GPU behavior, opening doors to hands-on graphics system development for students, hobbyists, and researchers alike.



## Introduction
The Snake game, a classic arcade game that originated in the late 1970s, has been widely used as a pedagogical tool to introduce concepts in algorithm design and embedded system development. Traditionally, implementations of the Snake game have utilized microcontrollers or software platforms. However, with advancements in hardware description languages (HDLs) and FPGA technology, there has been a shift towards hardware-only implementations to exploit the parallel processing capabilities of FPGAs.

In this project, we present an FPGA-based implementation of the Snake game using Verilog HDL on the Nexys4 DDR Artix-7 FPGA board. This approach emphasizes a hardware-centric design, leveraging the FPGA's resources to handle real-time game logic, video output, and user input processing. By utilizing the FPGA's parallelism, we achieve a responsive gaming experience without the need for a traditional microprocessor or external memory modules.

The motivation behind this project is twofold: firstly, to demonstrate the feasibility and advantages of implementing complex real-time systems solely in hardware; and secondly, to provide an educational platform for understanding digital design concepts such as finite state machines (FSMs), VGA signal generation, and peripheral interfacing. Similar projects have been undertaken using different FPGA platforms, highlighting the versatility and educational value of such implementations.

##Literature Review
The implementation of classic games like Snake on FPGAs has been explored in various academic and hobbyist projects, each highlighting unique challenges and solutions.

Singla and Narula demonstrated the feasibility of implementing the Snake game using Verilog HDL on an FPGA platform. Their work emphasized the educational value of such projects in understanding digital design concepts. However, they noted limitations in scalability and modularity, which could hinder the addition of advanced features.

Lovegrove et al. developed a version of Snake on the Altera DE2 Cyclone IV board, utilizing VGA output and PS/2 keyboard input. They faced challenges in VGA signal generation and keyboard interfacing, which required meticulous timing control and synchronization.

Du's project introduced an innovative control mechanism using camera-based hand gesture recognition for the Snake game on FPGA. While this approach enhanced interactivity, it introduced complexities in real-time image processing and resource management on the FPGA.

Geier et al. presented 'Syntroids,' a space shooter game synthesized from Temporal Stream Logic specifications. Their work highlighted the potential of high-level synthesis in game development on FPGAs but also pointed out the challenges in achieving optimal performance compared to manual HDL coding.

Scherlis discussed issues encountered in his FPGA-based Snake game, such as bus contention due to multiple always blocks driving the same signal, inefficient memory usage leading to resource constraints, and inaccuracies in collision detection logic.

These studies underscore common challenges in FPGA-based game development, including:

- **Resource Constraints**: Limited logic elements and memory on FPGAs necessitate efficient design strategies.
- **Timing and Synchronization**: Ensuring precise timing for video output and input handling is critical.
- **Modularity and Scalability**: Designing modular components facilitates easier integration of additional features.
- **Debugging Complexity**: Hardware debugging is inherently more complex than software debugging, requiring specialized tools and methodologies.


Our project builds upon these insights by adopting a modular design approach, optimizing resource utilization, and integrating advanced features such as real-time sound effects, dynamic obstacle generation, and enhanced collision detection mechanisms.

## Objectives

The primary objective of this project is to develop a real-time, fully hardware-based implementation of the classic Snake game on the Nexys4 DDR Artix-7 FPGA platform using Verilog HDL. The key goals of the project include:

- **Design and implement a modular and scalable Snake game architecture in Verilog HDL**:  
  Emphasis is placed on reusability, hierarchy, and readability of code, which is a best practice in digital system design [^1].

- **Utilize pushbutton-based user inputs for direction control**:  
  This involves debouncing logic and edge detection mechanisms to ensure accurate and responsive control, which is critical in interactive systems [^2].

- **Generate real-time VGA signals for graphical game rendering**:  
  Design a custom VGA controller to drive a 640×480 resolution display using standard 25.175 MHz pixel timing and color encoding techniques. This aligns with hardware VGA protocols detailed in FPGA application literature [^3].

- **Implement collision detection and dynamic game logic in hardware**:  
  This includes FSM-based tracking of the snake’s position, detecting interactions with boundaries and self, and adjusting the game state accordingly in real-time.

- **Integrate a 7-segment display and on-screen overlay for score tracking**:  
  Convert binary score values into visual outputs using time-multiplexed control logic for user feedback.

- **Enhance gameplay experience with audio output using PWM**:  
  Implement a basic sound system that plays a tone whenever the snake consumes an apple, adding sensory interaction to the hardware game loop [^4].

- **Explore FPGA-based system design for educational purposes**:  
  This project provides hands-on experience with finite state machines, synchronization, timing analysis, memory mapping, and peripheral interfacing, aligning with common learning goals in undergraduate digital design curricula.

## Methodology

The implementation of the Snake game on the Nexys4 DDR Artix-7 FPGA board is centered around rendering directly to a VGA-compatible display at a resolution of 640×480 pixels. Unlike traditional software-based grid logic, this design operates entirely using pixel coordinates mapped in real-time, providing direct control over video output signals and graphical elements.

### Pixel-Based Rendering on VGA

The VGA display is driven at a resolution of 640×480 using a pixel clock of 25.175 MHz, as specified by VGA standards. The VGA controller module generates the horizontal and vertical synchronization (HSYNC and VSYNC) signals, along with real-time tracking of pixel positions using horizontal and vertical counters. Game elements such as the snake, apples, and boundaries are rendered by comparing these pixel counters against stored coordinate data, allowing each object to be displayed as a group of colored blocks on the screen.

### Snake Representation and Movement

The snake is represented using a collection of square pixel blocks (typically 8×8 or 16×16 pixels per block) whose head and body segment positions are updated each clock cycle based on user input. The snake’s movement direction is captured from debounced pushbutton inputs and stored in state registers. As the snake moves, each body segment updates its location by inheriting the position of the segment ahead of it. These pixel coordinates are then used to match against the current pixel counters during VGA rendering to color the snake appropriately (e.g., yellow for the head, red for the body).

### Apple Placement using LFSR

To simulate randomness in the game, apples are placed at arbitrary pixel-aligned coordinates using a Linear Feedback Shift Register (LFSR) [^5]. The LFSR generates pseudo-random binary sequences which are scaled to valid pixel positions that align with the snake’s body block size. This ensures apples appear visibly distinct and do not overlap with partial pixels.

### Collision Detection and Game Logic

Collision detection is handled by comparing the head position of the snake with the positions of its body segments and the display boundaries. If a match occurs, a 'Game Over' state is triggered. The FSM governing the game states transitions between idle, running, and game-over modes based on these real-time comparisons.

### Scoring and Display

Each time the snake consumes an apple (i.e., its head coordinates match the apple’s coordinates), a scoring module increments the player's score. This score is then displayed both on the VGA output and on the board's 7-segment display. The segment controller converts binary values into the appropriate control signals for the display anodes and cathodes.

### Sound Feedback using PWM

An additional enhancement is the use of sound feedback whenever the snake consumes an apple. A PWM module generates a square wave at an audible frequency which drives a speaker connected to the board. The tone is triggered by a flag that is set during the apple consumption event, providing immediate sensory feedback.

### Modular HDL Design

Each component in the system—input decoder, position tracker, VGA controller, LFSR-based apple generator, score display, and sound module—is encapsulated in its own Verilog module. This modularity facilitates parallel development, debugging, and potential scalability for future features such as dynamic walls or multiplayer support.

## Implementation

The Snake game was implemented using a structured modular design methodology in Verilog HDL. Each module was created to handle a dedicated function, ensuring the system remained scalable, easy to debug, and logically compartmentalized. Below is a detailed description of each critical subsystem.

### Top-Level Module: `snake_top.v`

This module acts as the backbone of the system, integrating and interfacing all submodules. It manages the global reset signal, distributes system and pixel clocks, routes directional inputs from pushbuttons, and ensures synchronized data flow between the VGA controller, game logic, and peripherals.

Responsibilities include:

- Button debouncing and direction decoding  
- Signal routing for video, audio, and display control  
- FSM coordination for game states (e.g., playing, reset, game over)

### Clock Management: `Clock_Divider_2.v`

The 100 MHz onboard clock is divided to create:

- A 25 MHz pixel clock for VGA rendering at 640×480 @ 60 Hz  
- A slower "tick" clock (a few Hz) to control snake movement speed

This separation ensures flicker-free graphics and smooth gameplay timing.

### Random Apple Generation: `Random_Generator.v`

A 20-bit Linear Feedback Shift Register (LFSR) is used for pseudo-random apple placement. The output is scaled and aligned to grid positions, ensuring apples appear fully within the playable area without overlapping the snake.

![Apple Generator Simulation](rg_sim.png)  
*Figure: Simulation waveform showing randomly generated apple positions*

### Snake Position Control: `Snake_Position_Controller.v`

Handles snake movement, growth, and collision logic using two parallel coordinate arrays (X and Y). Key functions:

- Shift-based movement propagation  
- Collision detection with body and wall boundaries  
- Snake growth management  
- State flags: `collision`, `growth_trigger`, and `game_over`

### VGA Signal Generation & Rendering: `vgacontroller.v`

Generates VGA timing signals (HSYNC, VSYNC) and renders all visible elements:

- Snake head: Yellow  
- Snake body: Green  
- Apples: Red  
- Background: Black  
- Optional walls: White

![Game Field Layout](proposed_layout.png)  
*Figure: Proposed design layout of the Snake game on VGA*

#### Embedded Text Display Modules

- `textgenerator.v`: Displays current and high scores in ASCII format  
- `go_generator.v`: Renders a large "GAME OVER" text overlay on the VGA display

These enhance usability and game status visibility.

### Score Display System: `disp_7_seg.v`, `seg_mapping.v`, `anode_sel.v`

Provides real-time score feedback on the board's 7-segment display:

- `disp_7_seg.v`: Converts binary score to BCD  
- `seg_mapping.v`: Encodes BCD to 7-segment patterns  
- `anode_sel.v`: Time-multiplexes digit display at high frequency

This works in tandem with the on-screen score.

### Sound Generation: `play_sound.v`

Generates an audible tone when the snake consumes an apple using PWM:

- Triggered by a flag from the position controller  
- Drives the `AUD_PWM` output pin  
- Produces clear, short sound for enhanced feedback

---

Each module was simulated, verified, and tested incrementally on hardware before final top-level integration. The final design offers real-time VGA rendering, responsive control, and audiovisual feedback—all in fully-synthesizable Verilog HDL.


## Hardware Implementation

The Snake game is implemented on the **Nexys4 DDR Artix-7 FPGA** board, leveraging several onboard peripherals. Each component is interfaced through Verilog HDL modules to create a cohesive, real-time gaming system.

### Nexys4 DDR Board Overview

![Nexys4 Board](Nexys_4.png)

![Board Features](Nexys4_features.png)  
*Figure: Nexys4 DDR Artix-7 FPGA Board and its features*

### Utilized Hardware Components

#### 🔘 Pushbuttons (`BTNU`, `BTND`, `BTNL`, `BTNR`)
Used for directional control of the snake. Connected to input pins specified in the board's constraint file. Debouncing and edge detection logic ensure reliable movement.

#### 🔀 Switches (`SW0`)
Acts as a system reset. It reinitializes game parameters like score, snake length, and apple position. Monitored by the top-level module to trigger a synchronous reset.

#### 🎮 VGA Output (`J15–P17`)
Outputs video using a 12-bit color interface (4 bits each for R, G, B), along with horizontal and vertical sync (HSYNC, VSYNC). The VGA controller renders the game in **640×480 @ 60 Hz** resolution.

![VGA Block Diagram](VGA%20display%20controller%20block%20diagram.png)  
*Figure: VGA display controller block diagram*

![VGA Timing Diagram](Signal%20timings%20for%20a%20640-pixel%20by%20480%20row%20display%20using%20a%2025MHz%20pixel%20clock%20and%2060Hz%20vertical%20refresh.png)  
*Figure: VGA signal timings (640×480 @ 25 MHz pixel clock)*

![Horizontal Sync](VGA%20Horizontal%20Synchronization.png)  
*Figure: VGA Horizontal Synchronization details*

#### 🧮 7-Segment Display (`AN0–AN7`)
Displays current and high scores using multiplexed scanning:

- `disp_7_seg.v`: Converts binary score to BCD  
- `seg_mapping.v`: Encodes digits into 7-segment format  
- `anode_sel.v`: Selects each digit rapidly to simulate full display

![Common Anode Circuit](Common%20anode%20circuit%20node.png)  
*Figure: Common anode configuration*

![Multiplex Timing](Four%20digit%20scanning%20display%20controller%20timing%20diagram.png)  
*Figure: Four-digit display scanning timing*

#### 🔊 Audio Output (`AUD_PWM`)
Plays a tone when an apple is eaten. Uses PWM to generate an audible square wave:

- Connected to a 3.5mm mono audio jack through a low-pass filter
- Driven by `play_sound.v` module on event trigger

![Low Pass Filter](Sallen-Key%20Butterworth%20Low%20Pass%204th%20Order%20Fliter.png)  
*Figure: 4th order Butterworth filter circuit*

![PWM Waveform](Simple%20Waveform%20represented%20as%20PWM.png)  
*Figure: Simple waveform represented as PWM*

#### 💡 LED Indicators (`LD0–LD15`)
Optional debugging or status indicators:

- Can show paused state, game levels, or signal activity  
- Configured via simple Verilog assignments

---

All modules are designed to interface directly with the Nexys4 DDR board’s hardware in a modular and resource-efficient manner. This highlights the FPGA’s versatility for building real-time, interactive embedded systems.


## Milestones

The development of the Snake game on the **Nexys4 DDR Artix-7 FPGA** board was structured around a series of progressive milestones. Each phase added new features and increased complexity, ultimately resulting in a feature-rich, interactive game. Below is a chronological list of these milestones with corresponding video demonstrations:

---

### 1. 🟢 Initial Snake Movement and Apple Generation
- Implemented directional snake movement via pushbuttons.
- Apples generated at random positions using a **Linear Feedback Shift Register (LFSR)**.
- Established the core game loop.

🎥 [Video Demonstration](https://drive.google.com/file/d/1VH5fjJU-sfb0p0TpvSgG0Nv5H6BvyFm1/view?usp=drive_link)

---

### 2. 🐍 Snake Growing in Length
- Added logic to increase snake length upon apple consumption.
- Managed dynamic memory to update the snake’s body segments efficiently.

🎥 [Video Demonstration](https://drive.google.com/file/d/1xdp1eKV_1xwMywKhjtfWEIcs2qsyNAic/view?usp=drive_link)

---

### 3. 🧱 IEEE Logo and Boundary Walls
- Rendered the **IEEE logo** on the VGA display.
- Introduced boundary walls to define game limits.
- Involved precise pixel mapping and VGA sync.

🎥 [Video Demonstration](https://drive.google.com/file/d/1Qann0qEGrsj_azzYh4T0ib6a-huPfXWe/view?usp=drive_link)

---

### 4. 💥 Collision Detection with Walls
- Implemented logic to detect when the snake collides with boundary walls.
- Triggered a game-over condition upon collision.

🎥 [Video Demonstration](https://drive.google.com/file/d/1XGfSrXy0BKy5ta1vG-pEFUObs2jib9ro/view?usp=drive_link)

---

### 5. 🔁 Collision Detection with Snake Body
- Extended collision detection to include **self-collision**.
- Required continuous tracking of the snake's head and body segments.

🎥 [Video Demonstration](https://drive.google.com/file/d/1oMd6vG7P0cxDGLl5jPVyTlT8j-74UkCm/view?usp=drive_link)

---

### 6. 🚧 Dynamic Walls Integration
- Added moving walls within the playfield to increase difficulty.
- Controlled wall motion using additional state machines.
- Collision logic updated to handle dynamic obstacles.

🎥 [Video Demonstration](https://drive.google.com/file/d/1wKyrR0TC6HxF4wR5of-MWGj9ViFcm6Q8/view?usp=drive_link)

---

### 7. 📺 On-Screen Score Display and Game Over Message
- Real-time score rendered directly on VGA output.
- Game Over message shown on snake death.

![Game Over](go_imp.png)  
*Figure: GAME OVER message displayed after wall collision*

---

### 8. 🔊 Sound Effects with PWM
- Added audio feedback when snake consumes an apple.
- Used **Pulse Width Modulation (PWM)** to generate tones via the FPGA’s audio output.

---

These milestones reflect the incremental progress made during development, with each stage tested and demonstrated in real hardware using the Nexys4 DDR board.

# Return of the Snake – FPGA Game Implementation

## Results

The Snake game was successfully implemented and tested on the Nexys4 DDR Artix-7 FPGA board. Each core module was validated both in simulation and on hardware to verify functional correctness and performance. The results demonstrate the system's real-time responsiveness, effective visual output, and overall stability. The key observations are as follows:

- **Gameplay Experience:**  
  The snake responds instantly to user inputs via the onboard pushbuttons with minimal latency. Direction changes are registered accurately, and the snake continues to move autonomously in the chosen direction until altered by the user. The modular FSM design ensures stable state transitions and consistent gameplay logic throughout the session.

- **VGA Output and Display Quality:**  
  The VGA controller generated a stable and flicker-free output at a resolution of 640×480 pixels, conforming to standard VGA timing specifications. The snake (colored red/yellow), apples (green), walls (white), and background (black) were clearly visible. Real-time updates of the snake’s motion and apple placements rendered seamlessly, confirming the effectiveness of pixel-matching logic and color encoding.

- **Score Tracking and Visualization:**  
  The scoring module correctly incremented the player's score for each apple consumed. This score was simultaneously displayed on the VGA screen and multiplexed to the onboard 7-segment displays using dynamic segment control. A high score register tracked the maximum score achieved within a session and displayed it upon game termination.

- **Collision Detection Robustness:**  
  Self-collision and boundary collisions were accurately detected by comparing the snake’s head position against all body segments and wall coordinates. These checks effectively transitioned the game into a terminal state with a “Game Over” display and final score output.

- **Apple Generation Validity:**  
  The pseudo-random generation of apple coordinates using LFSR ensured uniform distribution across the playfield. Apple positions were validated to avoid overlaps with the snake’s current body, ensuring fair and playable scenarios.

- **Audio Feedback:**  
  A sound pulse generated via the PWM module played a short beep sound through the audio output whenever an apple was consumed. This audio cue served as an engaging feedback mechanism, enhancing the user experience and confirming game events in real-time.

- **System Stability and Resource Utilization:**  
  The system operated consistently under sustained gameplay without glitches, reset triggers, or logic race conditions. Resource utilization was efficient—using a fraction of the available LUTs, flip-flops, and BRAMs on the Artix-7 FPGA—leaving sufficient headroom for future enhancements such as difficulty levels or multiplayer support.

---

## Conclusion

This project presents a comprehensive hardware-only implementation of the classic Snake game on the Nexys4 DDR Artix-7 FPGA platform, demonstrating the real-time capabilities and flexibility of FPGA-based digital design. Through the use of Verilog HDL, we successfully integrated key subsystems including user input processing, VGA signal generation, scoring mechanisms, collision detection, and PWM-based audio feedback.

The modular architecture employed throughout the project allowed for efficient development, testing, and future extensibility. Each component, from the FSM-based movement controller to the LFSR-based apple generator, was encapsulated in independently testable Verilog modules. This structure not only improved maintainability but also reflected best practices in digital hardware development [Singla2018, Geier2021].

Real-time responsiveness was achieved through precise timing synchronization and clock division, while the VGA controller provided a flicker-free graphical representation of the game at a resolution of 640×480. The successful rendering of game elements—along with score tracking and audio output—demonstrates the practical application of theoretical digital design concepts such as register management, memory mapping, pixel-level rendering, and FSM transitions.

The project reinforces the educational and prototyping potential of FPGA platforms in embedded system curricula. By avoiding reliance on embedded processors or external software, this implementation exemplifies how pure hardware design can be leveraged to build complete, interactive applications [Geier2021, SnakeFPGAInstructables].

Moreover, the efficient utilization of the Artix-7’s hardware resources showcases the scalability of this approach. The final design leaves significant unused FPGA capacity, allowing for future additions like dynamic walls, increasing difficulty levels, multiplayer modes, and alternative control mechanisms such as PS/2 or USB interfaces.

Ultimately, this project bridges the gap between theoretical digital logic and real-world system integration, providing a tangible demonstration of the power, responsiveness, and customizability of FPGA-based game development.

---

## Future Work

To expand on the current game, the following features can be considered:

1. **Dynamic Difficulty Levels:**  
   Increase snake speed, reduce apple durations, or add new obstacles dynamically as the game progresses.

2. **PS/2 Keyboard and Joystick Support:**  
   Support keyboard and joystick input using PS/2 interfaces for enhanced control.

3. **Timed Game and Countdown Modes:**  
   Implement time-based game modes to challenge players to score as much as possible under time constraints.

4. **Graphical Enhancements:**  
   Add background themes, gradient fills, and pixel animations for visual richness.

5. **Bonus Items and Power-Ups:**  
   Include special apples that offer additional points, speed boosts, or temporary invincibility.

6. **Moving Obstacles and Dynamic Walls:**  
   Add moving or periodically appearing obstacles for added challenge.

7. **Multiplayer Mode:**  
   Add two-player gameplay with separate controls and collision logic.

8. **Persistent High Score Storage:**  
   Save scores to flash or EEPROM for long-term storage even after power off.

9. **Customizable Game Settings:**  
   Allow player to configure difficulty, speed, controls, and graphics at startup.

10. **Enhanced Audio Feedback:**  
    Different sound effects for apples, collisions, game over, and special items.

11. **Debug/Educational Overlay Mode:**  
    Show FSM states, coordinates, or score registers on screen for learning purposes.

---

## Acknowledgments

We sincerely thank all contributors and supporters of this project.

Special thanks to the **IEEE Student Branch at NITK** and our mentors for their continuous guidance. We are also grateful to the following individuals and organizations:

- [Monish Subramani](https://www.linkedin.com/in/monish-subramani-28ba27250/) and [Shreyas Aney](https://www.linkedin.com/in/shreyasaney/) – for providing a VGA-compatible monitor.
- [Bhavy Parashar](https://www.linkedin.com/in/bhavy-parashar-92a67920a/) – for lending a speaker.
- [Jalak Kamdar](https://www.linkedin.com/in/jalakkamdar/) – for the AUX cable.
- **VLSI Laboratory, ECE Dept., NITK Surathkal** – for providing the FPGA board and VGA cable.

We also acknowledge the Digilent Nexys4 DDR platform documentation team for technical support.

---

## References

- [Return of the Snake GitHub Repo](https://github.com/IEEE-NITK/Return_Of_The_Snake)
- [Nexys4 DDR FPGA Board Manual](https://digilent.com/reference/_media/nexys4-ddr%3Anexys4ddr_rm.pdf)
- [Nexys A7-100T Master XDC File](https://github.com/Digilent/Nexys-A7-100T-Keyboard/blob/master/src%2Fconstraints%2FNexys-A7-100T-Master.xdc)
- Singla, N. & Narula, M.S., "FPGA Implementation of Snake Game Using Verilog HDL", IRJET 2018.  
  https://www.irjet.net/archives/V5/i5/IRJET-V5I5287.pdf
- [Snake Game for Cyclone IV](https://habr.com/en/articles/431226/)
- [Snake on an FPGA - Instructables](https://www.instructables.com/Snake-on-an-FPGA-Verilog/)
- [Yufan Du's Snake Game](https://www.yufandu.com/)
- Geier et al., "Syntroids: Synthesizing a Game for FPGAs", arXiv:2101.07232  
  https://arxiv.org/abs/2101.07232
- [Snake Game for FPGA – Tom Scherlis](https://tomscherlis.com/otw-portfolio/snake-game-for-fpga/)
- [Nandland – LFSR for FPGA](https://nandland.com/lfsr-linear-feedback-shift-register/)
- Arora et al., "FPGA-Based Multifunction Interface", ICAC3, Springer  
  https://link.springer.com/chapter/10.1007/978-94-007-1864-7_4
- [Snake Game FPGA Verilog – Almorsi](https://github.com/mohamedAlmorsi/snake-game-FPGA-Verilog)
- [FPGA Cat Invaders – Columbia University](https://www.cs.columbia.edu/~sedwards/classes/2024/4840-spring/designs/FPGA-Cat-Invaders.pdf)
- [Project F – Beginning FPGA Graphics](https://projectf.io/posts/fpga-graphics/)





### Mentors:
- [Madhav Kedia](https://github.com/madhavkedia018)
- [Rohan Abhilash S.](https://github.com/Rohan-Abhilash)
- [Omkar Chougule](https://github.com/Omkar-9545)


### Mentees:
- [Tarun Sirigiri](https://github.com/Tarun-Sirigiri)
- [Tejhuram Ravichandran](https://github.com/TejhuramRavichandran)

<!-- 
## References
[^1]: Singla, A., et al. (2018). *Snake Game on FPGA*.
[^2]: Scherlis, J. (n.d.). *FPGA Snake Game with Pushbutton Controls*.
[^3]: Instructables. *Snake Game on FPGA using VGA*.
[^4]: Du, H. (n.d.). *Sound Implementation in FPGA Snake Game*.
[^5]: Nandland. *Understanding LFSRs - Linear Feedback Shift Registers*. Available at: [https://nandland.com](https://nandland.com)
-->

