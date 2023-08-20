# README

This project aims to develop a mod for the boardgame "Message (風聲)".

# Features and Testing

1. Verify Removal of Unused Player Panels (Setup Button)
    1. Set up the game with various numbers of players.
    2. Press Setup Button; ensure unused Player Panels are removed.
    3. Ensure all players receive 3 character cards in hand zone and 1 identity card in the panel.
    4. Ensure correct identity card types.
2. Verify Warning for Unsupported Number of Players (Setup Button)
    1. Set players outside 3-7 range.
    2. Press Setup Button; check for warning message.
3. Verify Warning for Start Button with Hand Cards (Start Button)
    1. Have hand cards present for a player.
    2. Press Start Button; verify the warning.
4. Verify Warning for Start Without Character Card in Zone (Start Button)
    1. Omit character card in designated zone.
    2. Press Start Button; verify the warning.
5. Verify Game Start Logic (Start Button)
    1. After setting up, place character cards in the character zone and discard un-used hand cards.
    2. Press Start Button; verify action cards deal and turn setup.