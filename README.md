# Solid-Software-task
This repository contains technical task for the Solid Software company
## Task description
1. Install Flutter
2. Create a test application
3. The application should: display the text "Hello there" in the middle of the screen and after tapping anywhere on the screen, a background color should be changed to a randomly generated color (should be able to generate 16777216 colors using RGB). You can also add any other feature to the app - that adds bonus points
4. Please do not use any external libraries for color generation
5. Use solid_lints to perform static code analysis and fix any issues.
6. Don't use any "AI tools" like ChatGPT or similar.
7. Push code to GitHub
## App description
Created application follows requirements above and has 2 main features:
- On tap: changes background color to random one anywhere on the screen
- On long press: repeatedly changes random background colors until user releases the screen
AnimatedContainer widget was used in order to implement "smooth" color change and animation duration can be changed by editing the value of a "duration" variable
GestureDetector widget was used in order to implement "On tap" and "On long press" actions
