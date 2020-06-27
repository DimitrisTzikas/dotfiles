--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Xmonad-Config-File-------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

import XMonad

-- Layout
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.Maximize
import XMonad.Layout.NoBorders
import XMonad.Layout.PerScreen
import XMonad.Layout.MultiToggle
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.MultiToggle.Instances

-- Hooks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook

-- Actions
import XMonad.Actions.SinkAll
import XMonad.Actions.FloatKeys
import XMonad.Actions.CopyWindow
import XMonad.Actions.WindowBringer

-- XMonad Utilities
import XMonad.Util.EZConfig
import XMonad.Util.NamedScratchpad
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import System.Exit
import System.IO

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------Main--------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

main = xmonad =<< statusBar myBar myPP toggleStrutsKey (withUrgencyHook NoUrgencyHook $ myConfig)

--------------------------------------------------------------------------------------------------------------------
---------------------------------------------------General-Settings-------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myTerminal = "termite"
wp1 = "<fn=1>\xf120</fn>"
wp2 = "<fn=1>\xf121</fn>"
wp3 = "<fn=1>\xf02d</fn>"
wp4 = "<fn=1>\xf21b</fn>"
wp5 = "<fn=1>\xf07b</fn>"
wp6 = "<fn=1>\xf586</fn>"
wp7 = "<fn=1>\xf583</fn>"
wp8 = "<fn=1>\xf589</fn>"
wp9 = "<fn=1>\xf5b3</fn>"
wp10 = "NSP"
wp11 = "<fn=1>\xf019</fn>"
wp12 = "<fn=1>\xf1de</fn>"
wp13 = "<fn=1>\xf5a1</fn>"
wp14 = "<fn=1>\xf044</fn>"
wp15 = "<fn=1>\xf2b6</fn>"
wp16 = "<fn=1>\xf1d8</fn>"
wp17 = "<fn=1>\xf51f</fn>"

myConfig = def {
  terminal             = myTerminal
  , modMask            = mod4Mask
  , workspaces         = [wp1,wp2,wp3,wp4,wp5,wp6,wp7,wp8,wp9,wp10,wp11,wp12,wp13,wp14,wp15,wp16,wp17]
  , focusFollowsMouse  = True
  , borderWidth        = 0
  , normalBorderColor  = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor

  -- Key bindings
  , keys               = myKeyboardBindings
  , mouseBindings      = myMouseBindings

  -- Hooks, layout
  , layoutHook         = myLayout
  , startupHook        = myStartupHook
  , manageHook         = myManageHook
  , handleEventHook    = mempty
  , logHook            = return ()
}

--------------------------------------------------------------------------------------------------------------------
---------------------------------------------------Color-Settings---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myFocusedBorderColor   = "#2F4858" -- Color for focused border
myNormalBorderColor    = "#111F2D" -- Color for non-focused border
myHiddenNoWindowsColor = "#2F4858" -- Color for empty workspaces
myNonEmptyColor        = "#111F2D" -- Color for non-empty workspaces
myUrgentColor          = "#FF0000" -- Color for urgent workspace
myCurrentColor         = "#9E9396" -- Color for current workspace

--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Keyboard-Settings--------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask .|. shiftMask, xK_f) -- Toggle bar gap
myKeyboardBindings = \c -> mkKeymap c $ [
  ("M-<Return>",      spawn myTerminal)                                            -- Launch a terminal
  , ("M-<Backspace>", kill)                                                        -- Close focused window
  , ("M-S-<Space>",   sendMessage NextLayout)                                      -- Rotate through the available layout algorithms
  , ("M-k",           windows W.focusDown)                                         -- Move focus to the next window
  , ("M-j",           windows W.focusUp)                                           -- Move fouces to the previous window
  , ("M-l",           windows W.focusMaster)                                       -- Move focus to the master window
  , ("M-S-k",         windows W.swapDown)                                          -- Swap the focused window with the next window
  , ("M-S-j",         windows W.swapUp)                                            -- Swap the focused window with the previous window
  , ("M-S-l",         windows W.swapMaster)                                        -- Swap the focused window and the master window
  , ("M-'",           sendMessage Expand)                                          -- Expand the master area
  , ("M-;",           sendMessage Shrink)                                          -- Shrink the master area
  , ("M-S-'",         sendMessage (IncMasterN 1))                                  -- Increment the number of windows in the master area
  , ("M-S-;",         sendMessage (IncMasterN (-1)))                               -- Deincrement the number of windows in the master area
  , ("M-<Escape>",    sinkAll)                                                     -- Unfloat all windows
  , ("M-S-<Delete>",  io (exitWith ExitSuccess))                                   -- Quit xmonad
  , ("M-f", sendMessage ToggleLayout)                                              -- Toggle layout (Full screen)
  , ("M-a", screenWorkspace 0 >>= flip whenJust (windows . W.view))                -- Switch screen 0
  , ("M-s", screenWorkspace 1 >>= flip whenJust (windows . W.view))                -- Switch screen 1
  , ("M-S-<Insert>",  spawn "pkill xmobar && xmonad --restart")                    -- Restart xmonad
  , ("M-g", windows copyToAll)                                                     -- Copy to all workspaces
  , ("M-S-g", killAllOtherCopies)						   -- Kill all other copies
  , ("M-<Space>", spawn "exec= transset-df -a -m 0; sleep .1; transset-df -a -m 1; sleep .1; transset-df -a -m 0; sleep .1; transset-df -a -m 1") -- Flashes focused window (Needs transset-df)

  -- Floating windows
  --keysMoveWindowTo (x, y) (gx1, gy1) windowId
  --, ("M-S-p", withFocused (keysMoveWindowTo (1275,795) (1, 1)))
  --, ("M-S-p", withFocused (keysResizeWindow (0,20) (0,0)))                       -- Resize Y 20
  --, ("M-S-o", withFocused (keysResizeWindow (20,0) (0,0)))                       -- Resize X 20
  --, ("M-S-i", withFocused (keysResizeWindow (0,-20) (0,0)))                      -- Resize Y -20
  --, ("M-S-u", withFocused (keysResizeWindow (-20,0) (0,0)))                      -- Resize X -20
  --, ("M-p", withFocused (keysMoveWindow (0,20)))                                 -- Move down
  --, ("M-o", withFocused (keysMoveWindow (20,0)))                                 -- Move right
  --, ("M-i", withFocused (keysMoveWindow (0,-20)))                                -- Move up
  --, ("M-u", withFocused (keysMoveWindow (-20,0)))                                -- Move left

  --Mouse control via keyboard
  --, ("C-<KP_Left>", spawn "exec= xdotool mousemove_relative -- -70 0")
  --, ("C-<KP_Right>", spawn "exec= xdotool mousemove_relative 70 0")
  --, ("C-<KP_Up>", spawn "exec= xdotool mousemove_relative 0 -70")
  --, ("C-<KP_Down>", spawn "exec= xdotool mousemove_relative 0 70")
  --
  --, ("<KP_Home>", spawn "exec= xdotool mousemove_relative 0 -40 && xdotool mousemove_relative -- -40 0")
  --, ("<KP_Up>", spawn "exec= xdotool mousemove_relative 0 -40")
  --, ("<KP_Prior>", spawn "exec= xdotool mousemove_relative 0 -40 && xdotool mousemove_relative 40 0")
  --, ("<KP_Right>", spawn "exec= xdotool mousemove_relative 40 0")
  --, ("<KP_Next>", spawn "exec= xdotool mousemove_relative 0 40 && xdotool mousemove_relative 40 0")
  --, ("<KP_Down>", spawn "exec= xdotool mousemove_relative 0 40")
  --, ("<KP_End>", spawn "exec= xdotool mousemove_relative 0 40 && xdotool mousemove_relative -- -40 0")
  --, ("<KP_Left>", spawn "exec= xdotool mousemove_relative -- -40 0")
  --
  --, ("<KP_Begin>", spawn "exec= xdotool click 1")
  --, ("C-<KP_Begin>", spawn "exec= xdotool click 3")

  -- mod-[0..9], Go to workspace N
  , ("M-1",       windows $ W.greedyView wp1)
  , ("M-2",       windows $ W.greedyView wp2)
  , ("M-3",       windows $ W.greedyView wp3)
  , ("M-4",       windows $ W.greedyView wp4)
  , ("M-5",       windows $ W.greedyView wp5)
  , ("M-6",       windows $ W.greedyView wp6)
  , ("M-7",       windows $ W.greedyView wp7)
  , ("M-8",       windows $ W.greedyView wp8)
  , ("M-9",       windows $ W.greedyView wp9)
  , ("M-0",       windows $ W.greedyView wp10)
  , ("M--",       windows $ W.greedyView wp11)
  , ("M-=",       windows $ W.greedyView wp12)
  , ("M-`",       windows $ W.greedyView wp13)
  , ("M-<Tab>",   windows $ W.greedyView wp14)
  , ("M-[",       windows $ W.greedyView wp15)
  , ("M-]",       windows $ W.greedyView wp16)
  , ("M-\\",      windows $ W.greedyView wp17)

  -- mod-shift-[0..9], Move client to workspace N
  , ("M-S-1",     windows $ W.shift wp1)
  , ("M-S-2",     windows $ W.shift wp2)
  , ("M-S-3",     windows $ W.shift wp3)
  , ("M-S-4",     windows $ W.shift wp4)
  , ("M-S-5",     windows $ W.shift wp5)
  , ("M-S-6",     windows $ W.shift wp6)
  , ("M-S-7",     windows $ W.shift wp7)
  , ("M-S-8",     windows $ W.shift wp8)
  , ("M-S-9",     windows $ W.shift wp9)
  , ("M-S-0",     windows $ W.shift wp10)
  , ("M-S--",     windows $ W.shift wp11)
  , ("M-S-=",     windows $ W.shift wp12)
  , ("M-S-`",     windows $ W.shift wp13)
  , ("M-S-<Tab>", windows $ W.shift wp14)
  , ("M-S-[",     windows $ W.shift wp15)
  , ("M-S-]",     windows $ W.shift wp16)
  , ("M-S-\\",    windows $ W.shift wp17)
  ]

  ++
  [
  -- Amixer audio controls
  ("<XF86AudioRaiseVolume>", spawn "exec= volume up")       -- Increase audio volume
  , ("<XF86AudioLowerVolume>", spawn "exec= volume down")   -- Decrease audio volume
  , ("<XF86AudioMute>",        spawn "exec= volume toggle") -- Mute audio
  -- Music controls
  , ("<XF86AudioPlay>", spawn "exec= playerctl play-pause") -- Play/Pause
  , ("<XF86LaunchA>", spawn "exec= playerctl play-pause")   -- Play/Pause
  , ("<XF86AudioNext>", spawn "exec= playerctl next")       -- Next
  , ("<XF86Explorer>", spawn "exec= playerctl next")        -- Next
  , ("<XF86AudioPrev>", spawn "exec= playerctl previous")   -- Previous
  , ("<XF86Search>", spawn "exec= playerctl previous")      -- Previous
  , ("M-<XF86AudioRaiseVolume>", spawn "exec= volume music-up")     -- Increase audio volume
  , ("M-<XF86AudioLowerVolume>", spawn "exec= volume music-down")   -- Decrease audio volume
  ]

  ++
  [
  -- Change language
  ("M-,",   spawn "exec= language en")
  , ("M-.",   spawn "exec= language gr")
  ]

  ++
  [
  -- Screen/s control
  ("M-S-s",                 spawn "xrandr | egrep 'VGA-1 connected .* [[:digit:]]+' && xrandr --output VGA-1 --off && xrandr --output LVDS-1 --primary || xrandr --output VGA-1 --left-of LVDS-1 --auto;pkill xmobar;xmonad --restart")  -- Toggle main screen
  , ("M-S-a",               spawn "xrandr | egrep 'LVDS-1 connected .* [[:digit:]]+' && xrandr --output LVDS-1 --off || xrandr --output LVDS-1 --right-of VGA-1 --auto;pkill xmobar;xmonad --restart") -- Toggle second screen
  , ("M-S-d",               spawn "xrandr | grep -e 'VGA-1 [^ ]* primary' && xrandr --output LVDS-1 --primary || xrandr --output VGA-1 --primary;pkill xmobar;xmonad --restart") -- Toggle primary screen
  , ("M-<Delete>",          spawn "exec= xset dpms force off")                                                                                                                        -- Turn screen/s off
  , ("M-m",                 spawn "exec= mountdm")                                                                                                                                   -- Dmenu Mount
  , ("M-S-m",               spawn "exec= umountdm")                                                                                                                                  -- Dmenu Unmount
  , ("M-d",                 spawn "exec= rofi -show drun -theme apps.rasi")                                                                                                                            -- Launch rofi
  , ("<XF86ScreenSaver>",   spawn "exec= lock")                                                                                                                                      -- Lock
  ]

  ++
  [
  -- Bind applications
  ("<XF86Launch1>", spawn "exec= luanch")
  , ("<Print>",     spawn "exec= cd ~/Pictures && scrot 'Screenshot-$wx$h.png' && notify-send 'Cheeese!!' 'Taking screenshoot'")
  , ("M-<Print>",   spawn "exec= gnome-screenshot -a")
  , ("M-q",         spawn "exec= firefox -P Main")
  , ("M-S-q",       spawn "exec= firefox -P research")
  , ("M-w",         spawn "exec= libreoffice")
  , ("M-e",         spawn "exec= emacs")
  , ("M-y",         spawn "exec= clip=$(xclip -selection c -o); mpv --ytdl-format='bestvideo[ext=mp4][height<=?720]+bestaudio[ext=m4a]' $clip")
  , ("M-S-y",       spawn "exec= clip=$(xclip -selection c -o); mpv --ytdl-format='bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]' $clip")
  , ("M-c",         spawn "exec= gnome-calculator")
  , ("M-b",         spawn "exec= evince")
  , ("M-S-b",       spawn "exec= com.github.babluboy.bookworm")
  , ("M-v",         spawn "exec= anki")
  , ("M-S-n",       spawn "exec= zim")
  , ("M-x",         spawn "exec= redshift -O 3500")
  , ("M-S-x",       spawn "exec= redshift -x")
  ]

  ++
  [
  -- Scratchpad
  ("M-h", namedScratchpadAction scratchpads "mpv")
  , ("M-S-h", gotoMenu)
  ]

  ++
  [
  -- Desk control
  ("M-u",          spawn "exec= desk r")
  , ("M-i",        spawn "exec= desk m")
  , ("M-o",        spawn "exec= desk l")
  , ("M-p",        spawn "exec= desk bl")
  ]

--------------------------------------------------------------------------------------------------------------------
---------------------------------------------------Mouse-Settings---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $ [
  ((modm, button1), (\w -> focus w   >> mouseMoveWindow w
                                     >> windows W.shiftMaster))
  , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
  , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                     >> windows W.shiftMaster))
  ]

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------Layouts-Settings--------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myLayout =
  toggleLayouts (noBorders Full)
  $ avoidStruts
  $ onWorkspace wp2 (tiledGaps ||| tiled ||| emptyBSP ||| centered ||| centeredLarge)
  $ onWorkspace wp3 (tiledGaps ||| tiled)
  $ onWorkspace wp9 (Tall nmaster delta (9/12))
  $ onWorkspace wp10 (noBorders Full ||| tiledGaps)
  $ onWorkspace wp11 (noBorders Full ||| tiledGaps)
  $ onWorkspace wp12 (noBorders Full ||| tiledGaps)
  $ onWorkspace wp13 (noBorders Full ||| tiledGaps)
  $ onWorkspace wp15 (noBorders Full ||| tiledGaps)
  $ onWorkspace wp16 (noBorders Full ||| tiledGaps)
  $ onWorkspace wp17 (noBorders Full)
  $ tiledGaps ||| tiled ||| threeColumns

  where
    -- General
    tiledGaps = spacing 10 $ Tall nmaster delta ratio
    tiled = Tall nmaster delta (1/2)
    threeColumns = ThreeColMid nmaster delta (6/12)
    centered = gaps [(L,300), (R,300)] $ Full
    centeredLarge = gaps [(L,200), (R,200)] $ Full

    -- Default number of windows in master pane
    nmaster = 1
    -- Percent of the screen to increment when resizing
    delta = 5/100
    -- Default proportion of the screen taken up by main pane
    ratio = 8/12

--------------------------------------------------------------------------------------------------------------------
------------------------------------------------Scratchpad-Settings-------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

scratchpads = [ (NS "mpv" "mpv" (className =? "mpv") (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))) ]

--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Status-Bar-Settings------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myBar = "$(xmobar ~/.xmonad/xmobar.conf) & $(xmobar ~/.xmonad/xmobar-top.conf)"

myPP = xmobarPP {
  ppVisible           = xmobarColor myNonEmptyColor ""
  , ppCurrent         = xmobarColor myCurrentColor ""
  , ppHiddenNoWindows = xmobarColor myHiddenNoWindowsColor ""
  , ppUrgent          = xmobarColor myUrgentColor ""
  , ppTitle   = const ""
  , ppLayout  = const ""
  }

--------------------------------------------------------------------------------------------------------------------
---------------------------------------------------Hooks-Settings---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myStartupHook = do
  setWMName "LG3D"
  spawn "exec= pkill stalonetray;xrandr | grep -e 'VGA-1 [^ ]* primary' && stalonetray -geometry 1+0 --grow-gravity NW --icon-gravity NW || stalonetray"
  -- spawn "exec= pkill xcompmgr;xcompmgr -f -I 0.05 -O 0.05 &"
  spawn "exec= pkill xcompmgr;xcompmgr &"
  spawn "exec= xsetroot -cursor_name left_ptr"
  spawn "exec= pkill dunst;dunst &"
  spawn "exec= xset -dpms && xset s noblank && xset s off && xset b off"
  spawn "exec= xmodmap ~/.Xmodmap"
  spawn "exec= ./.fehbg"

myManageHook = composeAll [

  className =? "Java"                       --> doFloat
  , className =? "kodi"                     --> doFloat
  , className =? "Gpick"                    --> doFloat
  , className =? "float"                    --> doFloat
  -- Windows force
  , className =? "Termite"                  --> doShift wp1
  --
  , className =? "Subl3"                    --> doShift wp2
  , className =? "Emacs"                    --> doShift wp2
  , className =? "GitKraken"                --> doShift wp2
  , className =? "code-oss"                 --> doShift wp2
  , className =? "Sublime_text"             --> doShift wp2
  , className =? "Apache NetBeans IDE 11.2" --> doShift wp2
  , className =? "jetbrains-idea-ce"        --> doShift wp2
  , className =? "jetbrains-studio"         --> doShift wp2
  , className =? "com.oracle.javafx.scenebuilder.app.SceneBuilderApp" --> doShift wp2
  
  --
  , className =? "Evince"                   --> doShift wp3
  , className =? "Anki"                     --> doShift wp3
  , className =? "Com.github.babluboy.bookworm" --> doShift wp3
  --
  , className =? "firefox"                  --> doShift wp4
  , className =? "Tor Browser"              --> doShift wp4
  , className =? "qutebrowser"              --> doShift wp4
  --
  , className =? "Org.gnome.Nautilus"       --> doShift wp5
  , className =? "VirtualBox Manager"       --> doShift wp5
  , className =? "Filezilla"                --> doShift wp5
  , className =? "aft-linux-qt"             --> doShift wp5
  , className =? "Gimp-2.10"                --> doShift wp5
  --
  , className =? "Steam"                    --> doShift wp9
  , className =? "zoom"                     --> doShift wp9
  --
  , className =? "mpv"                      --> doShift wp10
  --
  , className =? "Transmission-gtk"         --> doShift wp11
  --
  , className =? "pgadmin4"                 --> doShift wp12
  , className =? "MEGAsync"                 --> doShift wp12
  , className =? "Syncthing GTK"            --> doShift wp12
  , className =? "Lxappearance"             --> doShift wp12
  , className =? "Blueberry.py"             --> doShift wp12
  , className =? "Pavucontrol"              --> doShift wp12
  --
  , className =? "Simplenote"               --> doShift wp13
  , className =? "Zim"                      --> doShift wp13
  --
  , className =? "libreoffice-startcenter"  --> doShift wp14
  , className =? "libreoffice-writer"       --> doShift wp14
  , className =? "libreoffice"              --> doShift wp14
  --
  , className =? "scrcpy"                   --> doShift wp15
  , className =? "Evolution"                --> doShift wp15
  , className =? "Liferea"                  --> doShift wp15
  , className =? "Gnome-calendar"           --> doShift wp15
  , className =? "Trello"                   --> doShift wp15
  
  --
  , className =? "TelegramDesktop"          --> doShift wp16
  , className =? "discord"                  --> doShift wp16
  , className =? "Slack"                    --> doShift wp16
  , className =? "Signal"                   --> doShift wp16
  ---
  , className =? ""                         --> doShift wp17
  , className =? "Rhythmbox"                --> doShift wp17
  ]
  
