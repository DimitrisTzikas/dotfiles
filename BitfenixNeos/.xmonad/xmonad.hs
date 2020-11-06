--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Xmonad-Config-File-------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

import XMonad

-- Layout
import XMonad.Layout.Gaps
import XMonad.Layout.IfMax
import XMonad.Layout.Spacing
import XMonad.Layout.Maximize
import XMonad.Layout.PerScreen
import XMonad.Layout.NoBorders
import XMonad.Layout.PerScreen
import XMonad.Layout.MultiToggle
import XMonad.Layout.SimpleFloat
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
import XMonad.Actions.CopyWindow
import XMonad.Actions.WindowBringer

-- XMonad Utilities
import XMonad.Util.EZConfig
import XMonad.Util.NamedScratchpad
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.Exit
import System.IO

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------Main--------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

--------------------------------------------------------------------------------------------------------------------
---------------------------------------------------General-Settings-------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myTerminal = "alacritty"

primaryDisplay = "HDMI-1"

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

myFocusedBorderColor   = "#2E5049" -- Color for focused border
myNormalBorderColor    = "#203032" -- Color for non-focused border
myHiddenNoWindowsColor = "#2E5049" -- Color for empty workspaces
myNonEmptyColor        = "#203032" -- Color for non-empty workspaces
myUrgentColor          = "#FF0000" -- Color for urgent workspace
myCurrentColor         = "#C9C3B4" -- Color for current workspace

--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Keyboard-Settings--------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask .|. shiftMask, xK_z) -- Toggle bar gap

myKeyboardBindings = \c -> mkKeymap c $ [
  ("M-<Return>",         spawn myTerminal)                                -- Launch a terminal
  , ("M-<Backspace>",    kill)                                            -- Close focused window
  , ("M-S-<Space>",      sendMessage NextLayout)                          -- Rotate through the available layouts
  , ("M-k",              windows W.focusDown)                             -- Move focus to the next window
  , ("M-j",              windows W.focusUp)                               -- Move fouces to the previous window
  , ("M-l",              windows W.focusMaster)                           -- Move focus to the master window
  , ("M-S-k",            windows W.swapDown)                              -- Swap the focused window with the next window
  , ("M-S-j",            windows W.swapUp)                                -- Swap the focused window with the previous window
  , ("M-S-l",            windows W.swapMaster)                            -- Swap the focused window and the master window
  -- , ("M-'",           sendMessage Expand)                              -- Expand the master area
  -- , ("M-;",           sendMessage Shrink)                              -- Shrink the master area
  -- , ("M-S-'",         sendMessage (IncMasterN 1))                      -- Increment the number of windows in the master area
  -- , ("M-S-;",         sendMessage (IncMasterN (-1)))                   -- Deincrement the number of windows in the master area
  , ("M-<Escape>",        sinkAll)                                        -- Unfloat all windows
  , ("M-S-<Insert>",      spawn "pkill xmobar && xmonad --restart")       -- Restart xmonad
  , ("M-S-<Delete>",      io (exitWith ExitSuccess))                      -- Quit xmonad
  , ("M-f",               sendMessage ToggleLayout)                       -- Toggle layout (Full screen)
  , ("M-s",               gotoMenu)                                       -- Go to window
  -- , ("M-a", screenWorkspace 0 >>= flip whenJust (windows . W.view))    -- Switch screen 0
  -- , ("M-s", screenWorkspace 1 >>= flip whenJust (windows . W.view))    -- Switch screen 1
  , ("M-g",               windows copyToAll)                              -- Copy window to all workspaces
  , ("M-S-g",             killAllOtherCopies)			          -- Kill window all other copies
  , ("M-<Space>",         spawn "exec= flash")                            -- Flashes focused window (Needs transset-df)
  , ("M-,",               spawn "exec= language en")                      -- Change keyboard layout
  , ("M-m",               spawn "exec= mountdm")                          -- Dmenu Mount
  , ("M-S-m",             spawn "exec= umountdm")                         -- Dmenu Unmount
  , ("M-d",               spawn "exec= rofi -show drun -theme apps.rasi") -- Launch rofi
  , ("<XF86ScreenSaver>", spawn "exec= lock --bg")                        -- Lock
  , ("<XF86Display>",     spawn "exec= lock --bg")                        -- Lock

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
  ("<XF86AudioRaiseVolume>", spawn "exec= volume -i")        -- Increase audio volume
  , ("<XF86AudioLowerVolume>", spawn "exec= volume -d")      -- Decrease audio volume
  , ("<XF86AudioMute>",        spawn "exec= volume -t")      -- Mute audio
  -- Music controls
  , ("<XF86AudioPlay>", spawn "exec= playerctl play-pause")  -- Play/Pause
  , ("<XF86LaunchA>", spawn "exec= playerctl play-pause")    -- Play/Pause
  , ("<XF86AudioNext>", spawn "exec= playerctl next")        -- Next
  , ("<XF86Explorer>", spawn "exec= playerctl next")         -- Next
  , ("<XF86AudioPrev>", spawn "exec= playerctl previous")    -- Previous
  , ("<XF86Search>", spawn "exec= playerctl previous")       -- Previous
  -- Brightness controls
  , ("<XF86MonBrightnessUp>", spawn "exec= brightness -i")   --Increase brightness
  , ("<XF86MonBrightnessDown>", spawn "exec= brightness -d") --Decrease brightness
  , ("M-r", spawn "exec= ") --Rotate screen
  ]

  ++
  [
  
  ]

  ++
  [
  -- Bind applications
  ("<XF86Launch1>", spawn "exec= launch")
  , ("<Print>",     spawn "exec= cd ~/Pictures && scrot 'Screenshot-$wx$h.png' && notify-send 'Cheeese!!' 'Taking screenshoot'")
  , ("M-<Print>",   spawn "exec= gnome-screenshot -a")
  , ("M-q",         spawn "exec= firefox -P Main")
  , ("M-w",         spawn "exec= libreoffice")
  , ("M-e",         spawn "exec= export LC_CTYPE=ja_JP.UTF-8 && emacs")
  , ("M-y",         spawn "exec= clip=$(xclip -selection c -o); mpv --ytdl-format='bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]' $clip")
  , ("M-b",         spawn "exec= evince")
  , ("M-S-b",       spawn "exec= calibre")
  ]

  ++
  [
  -- Scratchpad
  ("M-S-<Return>", namedScratchpadAction myScratchPads "terminal")
  , ("M-h", namedScratchpadAction myScratchPads "mpv")
  , ("M-c", namedScratchpadAction myScratchPads "gnome-calculator")
  , ("M-z", namedScratchpadAction myScratchPads "zoom")
  ]

  ++
  [
  -- Desk control
  ("M-u",          spawn "exec= desk r")
  , ("M-i",        spawn "exec= desk m")
  , ("M-o",        spawn "exec= desk l")
  , ("M-p",        spawn "exec= desk bl")
  , ("M-S-u",      spawn "exec= desk s")
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
  toggleLayouts (simpleFloat)
  $ onWorkspace wp1 (
  ifWider minResolution
    (IfMax 1 centered (tiled ||| threeColumns))
    (IfMax 3 (Tall 3 delta (1/2)) Full)
  )
  $ onWorkspace wp2 (
  ifWider minResolution
    (IfMax 1 centered (tiled ||| centered))
    (IfMax 2 (Tall 2 delta (1/2)) Full)
  )
  $ onWorkspace wp3 (
  ifWider minResolution
    (IfMax 1 centered (tiled))
    Full
  )
  $ onWorkspace wp4 (
  ifWider minResolution
    (IfMax 1 (centered ||| tiledGaps) (tiled ||| emptyBSP))
    (IfMax 2 (Tall 2 delta (1/2) ||| Full) Full)
  )
  $ onWorkspace wp5 (
  ifWider minResolution
    (IfMax 1 centered (tiled))
    Full
  )
  $ onWorkspace wp9 (
  ifWider minResolution
    (Tall 1 delta (9/12))
    Full
  )
  $ onWorkspace wp10 (
  ifWider minResolution
    (fullGaps ||| tiledGaps)
    Full
  )
  $ onWorkspace wp11 (
  ifWider minResolution
    (fullGaps ||| tiledGaps)
    Full
  )
  $ onWorkspace wp12 (
  ifWider minResolution
    (fullGaps ||| tiledGaps)
    Full
  )
  $ onWorkspace wp13 (
  ifWider minResolution
    (IfMax 1 centered (tiled ||| centered))
    (IfMax 2 (Tall 2 delta (1/2)) (Full))
  )
  $ onWorkspace wp15 (
  ifWider minResolution
    (fullGaps ||| tiledGaps)
    Full
  )
  $ onWorkspace wp16 (
  ifWider minResolution
    (fullGaps ||| tiledGaps)
    Full
  )
  $ onWorkspace wp17 (
  ifWider minResolution
    (fullGaps)
    Full
  )
  $ ifWider minResolution
  (IfMax 1 centered (tiled ||| emptyBSP))
  Full
  
  where
    -- General
    tiledGaps = spacing 10 $ Tall 1 delta (8/12)
    tiled = Tall 1 delta (1/2)
    threeColumns = ThreeColMid 1 delta (5/12)
    centered = gaps [(U, 10), (D, 10), (L,300), (R,300)] $ Full
    fullGaps = gaps [(U, 10), (D, 10), (L,250), (R,250)] $ Full
    -- Percent of the screen to increment when resizing
    delta = 5/100
    minResolution=1280

--------------------------------------------------------------------------------------------------------------------
------------------------------------------------Scratchpad-Settings-------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myScratchPads = [
  -- NS (WhatToExecute) (ProgramToExecute) (ClassName) (HowToManageWindow)
  NS "terminal" "termite" (resource =? "termite") manageTerm
  , NS "mpv" "mpv"  (className =? "mpv") manageTerm
  , NS "gnome-calculator" "gnome-calculator" (resource =? "gnome-calculator") manageTerm
  , NS "zoom" "zoom" (resource =? "zoom") manageTerm
  ]
  where
    manageTerm = (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Status-Bar-Settings------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myBar = "$(xmobar ~/.xmonad/xmobar.conf --wmclass=xmobar ) & $(xmobar ~/.xmonad/xmobar-top.conf --wmclass=xmobar)"

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
  spawn "exec= pkill stalonetray;stalonetray"
  spawn "exec= pkill picom;picom &"
  spawn (["exec= xrandr --output", primaryDisplay, "--primary"] >>= id)
  spawn "exec= xsetroot -cursor_name left_ptr"
  spawn "exec= pkill dunst;dunst &"
  spawn "exec= xset -dpms && xset s noblank && xset s off && xset b off"
  spawn "exec= xmodmap ~/.Xmodmap"
  spawn "exec= ./.fehbg"

myManageHook = composeAll [

  className =? "Java"                       --> doFloat
  , className =? "Gpick"                    --> doFloat
  , className =? "float"                    --> doFloat
  , className =? "Termite"                  --> doFloat
  , className =? "Gnome-calculator"         --> doFloat
  
  -- Windows force
  , className =? "Alacritty"                --> doShift wp1
  --
  , className =? "Emacs"                    --> doShift wp2
  , className =? "code-oss"                 --> doShift wp2
  , className =? "com.oracle.javafx.scenebuilder.app.SceneBuilderApp" --> doShift wp2
  , className =? "UnityHub"                 --> doShift wp2
  , className =? "Unity"                    --> doShift wp2
  --
  , className =? "Evince"                   --> doShift wp3
  , className =? "Com.github.babluboy.bookworm" --> doShift wp3
  , className =? "calibre"                  --> doShift wp3
  --
  , className =? "firefox"                  --> doShift wp4
  , className =? "Tor Browser"              --> doShift wp4
  , className =? "qutebrowser"              --> doShift wp4
  --
  , className =? "Org.gnome.Nautilus"       --> doShift wp5
  , className =? "VirtualBox Manager"       --> doShift wp5
  , className =? "Filezilla"                --> doShift wp5
  , className =? "aft-linux-qt"             --> doShift wp5
    --
  , className =? "StardewValley.bin.x86_64" --> doShift wp8
  , className =? "minecraft-launcher"       --> doShift wp8
  , className =? "FML early loading progress" --> doShift wp8
  --
  , className =? "mpv"                      --> doShift wp10
  --
  , className =? "Transmission-gtk"         --> doShift wp11
  --
  , className =? "Syncthing GTK"            --> doShift wp12
  , className =? "Lxappearance"             --> doShift wp12
  , className =? "Blueberry.py"             --> doShift wp12
  , className =? "Pavucontrol"              --> doShift wp12
  --
  , className =? "Chromium"                 --> doShift wp13
  , className =? "MuseScore3"               --> doShift wp13
  --
  , className =? "libreoffice-startcenter"  --> doShift wp14
  , className =? "libreoffice-writer"       --> doShift wp14
  , className =? "libreoffice"              --> doShift wp14
  , className =? "Blender"                  --> doShift wp14
  , className =? "Gimp-2.10"                --> doShift wp5
  --
  , className =? "scrcpy"                   --> doShift wp15
  , className =? "Evolution"                --> doShift wp15
  , className =? "Gnome-calendar"           --> doShift wp15
  
  --
  , className =? "TelegramDesktop"          --> doShift wp16
  , className =? "discord"                  --> doShift wp16
  , className =? "Slack"                    --> doShift wp16
  ---
  , className =? ""                         --> doShift wp17
  , className =? "Rhythmbox"                --> doShift wp17
  ]
  
