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

wp0 = "零"
wp1 = "一"
wp2 = "二"
wp3 = "三"
wp4 = "四"
wp5 = "五"
wp6 = "六"
wp7 = "七"
wp9 = "八"
wp8 = "九"
wp10 = "十"
wp11 = "十一"
wp12 = "十二"

myConfig = def {
  terminal             = myTerminal
  , modMask            = mod4Mask
  , workspaces         = [wp0,wp1,wp2,wp3,wp4,wp5,wp6,wp7,wp8,wp9,wp10,wp11,wp12]
  , focusFollowsMouse  = True
  , borderWidth        = 0
  , normalBorderColor  = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor

  -- Key bindings
  , keys               = myKeyboardBindings
  , mouseBindings      = myMouseBindings

  -- Hooks
  , layoutHook         = layout
  , startupHook        = myStartupHook
  , manageHook         = myManageHook
  , handleEventHook    = mempty
  , logHook            = return ()
}

--------------------------------------------------------------------------------------------------------------------
---------------------------------------------------Color-Settings---------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myFocusedBorderColor   = "#34334A" -- Color for focused border
myNormalBorderColor    = "#1B2233" -- Color for non-focused border
myHiddenNoWindowsColor = "#34334A" -- Color for empty workspaces
myNonEmptyColor        = "#1B2233" -- Color for non-empty workspaces
myUrgentColor          = "#AA5555" -- Color for urgent workspace
myCurrentColor         = "#FED4BA" -- Color for current workspace

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
  , ("M-;",              windows W.focusMaster)                           -- Move focus to the master window
  , ("M-S-k",            windows W.swapDown)                              -- Swap the focused window with the next window
  , ("M-S-j",            windows W.swapUp)                                -- Swap the focused window with the previous window
  , ("M-S-;",            windows W.swapMaster)                            -- Swap the focused window and the master window
  , ("M-]",           sendMessage Expand)                                 -- Expand the master area
  , ("M-[",           sendMessage Shrink)                                 -- Shrink the master area
  , ("M-S-]",         sendMessage (IncMasterN 1))                         -- Increment the number of windows in the master area
  , ("M-S-[",         sendMessage (IncMasterN (-1)))                      -- Deincrement the number of windows in the master area
  , ("M-<Escape>",        sinkAll)                                        -- Unfloat all windows
  , ("M-S-<Insert>",      spawn "pkill xmobar && xmonad --restart")       -- Restart xmonad
  , ("M-S-<Delete>",      io (exitWith ExitSuccess))                      -- Quit xmonad
  , ("M-<Delete>",        spawn "xset dpms force off")                    -- Turn off screen
  , ("M-f",               sendMessage ToggleLayout)                       -- Toggle layout (Full screen)
  , ("M-S-f",             gotoMenu)                                       -- Go to window
  , ("M-a", screenWorkspace 0 >>= flip whenJust (windows . W.view))       -- Switch screen 0
  , ("M-s", screenWorkspace 1 >>= flip whenJust (windows . W.view))       -- Switch screen 1
  , ("M-g",               windows copyToAll)                              -- Copy window to all workspaces
  , ("M-S-g",             killAllOtherCopies)			          -- Kill window all other copies
  , ("M-<Space>",         spawn "exec= flash")                            -- Flashes focused window (Needs transset-df)
  , ("M-,",               spawn "exec= language en")                      -- Change keyboard layout
  , ("M-S-,",             spawn "exec= xdotool key Caps_Lock")            -- Toggle Caps Lock
  , ("M-m",               spawn "exec= mountdm")                          -- Dmenu Mount
  , ("M-S-m",             spawn "exec= umountdm")                         -- Dmenu Unmount
  , ("M-d",               spawn "exec= rofi -show drun -theme apps.rasi") -- Launch rofi
  , ("<XF86ScreenSaver>", spawn "exec= lock --bg")                        -- Lock
  , ("M-l",               spawn "exec= lock --bg")                        -- Lock

  -- Go to workspace N
  , ("M-`",       windows $ W.greedyView wp0)
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

  -- Move client to workspace N
  , ("M-S-`",       windows $ W.shift wp0)
  , ("M-S-1",       windows $ W.shift wp1)
  , ("M-S-2",       windows $ W.shift wp2)
  , ("M-S-3",       windows $ W.shift wp3)
  , ("M-S-4",       windows $ W.shift wp4)
  , ("M-S-5",       windows $ W.shift wp5)
  , ("M-S-6",       windows $ W.shift wp6)
  , ("M-S-7",       windows $ W.shift wp7)
  , ("M-S-8",       windows $ W.shift wp8)
  , ("M-S-9",       windows $ W.shift wp9)
  , ("M-S-0",       windows $ W.shift wp10)
  , ("M-S--",       windows $ W.shift wp11)
  , ("M-S-=",       windows $ W.shift wp12)
  ]

  ++
  [
  -- Amixer audio controls
  ("<XF86AudioRaiseVolume>", spawn "exec= volume -i")        -- Increase audio volume
  , ("<XF86AudioLowerVolume>", spawn "exec= volume -d")      -- Decrease audio volume
  , ("<XF86AudioMute>", spawn "exec= volume -t")             -- Mute audio
  , ("<XF86Tools>", spawn "exec= volume -p")                 -- Change output
  -- Music controls
  , ("<XF86AudioPlay>", spawn "exec= playerctl play-pause")  -- Play/Pause
  , ("<XF86LaunchA>", spawn "exec= playerctl play-pause")    -- Play/Pause
  , ("<XF86AudioNext>", spawn "exec= playerctl next")        -- Next
  , ("<XF86Explorer>", spawn "exec= playerctl next")         -- Next
  , ("<XF86AudioPrev>", spawn "exec= playerctl previous")    -- Previous
  , ("<XF86Search>", spawn "exec= playerctl previous")       -- Previous
  -- Brightness controls
  , ("<XF86MonBrightnessUp>", spawn ("exec= brightness -i " ++ primaryDisplay))   --Increase brightness
  , ("<XF86MonBrightnessDown>", spawn ("exec= brightness -d " ++ primaryDisplay)) --Decrease brightness
  , ("M-r", spawn ("exec= rotate " ++ primaryDisplay)) --Rotate screen
  ]

  ++
  [
  -- Bind applications
  ("<XF86Launch5>", spawn "exec= launch")
  , ("M-<Tab>",     spawn "exec= quick")
  , ("<Print>",     spawn "exec= cd ~/Pictures && scrot 'Screenshot-$wx$h.png' && notify-send 'Cheeese!!' 'Taking screenshoot'")
  , ("M-<Print>",   spawn "exec= gnome-screenshot -a")
  , ("M-q",         spawn "exec= firefox -P Main")
  , ("M-e",         spawn "exec= emacsclient -c")
  , ("M-S-e",       spawn "exec= demacs")
  , ("M-y",         spawn "exec= clip=$(xclip -selection c -o); mpv --ytdl-format='bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]' $clip || mpv --ytdl $clip")
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
  , ("M-v", namedScratchpadAction myScratchPads "video")
  , ("M-x", namedScratchpadAction myScratchPads "passwords")
  ]

  ++
  [
  -- Desk control
  ("M-u",          spawn "exec= controller s")
  , ("M-i",        spawn "exec= controller p")
  , ("M-o",        spawn "exec= controller l")
  , ("M-p",        spawn "exec= controller b")
  , ("M-S-u",      spawn "exec= controller status")
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

layout =
  toggleLayouts (simpleFloat)
  $ onWorkspace wp0 (
  ifWider minResolution
    (IfMax 1 centered (tiled ||| centered))
    (IfMax 2 (Tall 2 delta (1/2)) (Full))
  )
  $ onWorkspace wp1 (
  ifWider minResolution
    (IfMax 1 centered (tiled ||| threeColumns))
    (IfMax 3 (Tall 3 delta (1/2)) Full)
  )
  $ onWorkspace wp2 (
  ifWider minResolution
    (IfMax 1 centered (tiled ||| centered))
    verticalDefault
  )
  $ onWorkspace wp3 (
  ifWider minResolution
    (IfMax 1 centered (tiled ||| centered))
    verticalDefault
  )
  $ onWorkspace wp4 (
  ifWider minResolution
    (IfMax 1 centered (tiled ||| centered))
    (IfMax 2 (Tall 2 delta (1/2) ||| Full) Full)
  )
  $ onWorkspace wp5 (
  ifWider minResolution
    (IfMax 1 centered (tiled))
    verticalDefault
  )
  $ onWorkspace wp6 (
  ifWider minResolution
    (IfMax 1 centered (tiled ||| centered))
    (IfMax 2 (Tall 2 delta (1/2)) (Full))
  )
  $ onWorkspace wp7 (
  ifWider minResolution
    (centered ||| Full)
    verticalDefault
  )
  $ onWorkspace wp8 (
  ifWider minResolution
    (fullGaps ||| tiled)
    verticalDefault
  )
  $ onWorkspace wp9 (
  ifWider minResolution
    (fullGaps ||| tiled)
    verticalDefault
  )
  $ onWorkspace wp10 (
  ifWider minResolution
    (fullGaps ||| tiled)
    verticalDefault
  )
  $ onWorkspace wp11 (
  ifWider minResolution
    (fullGaps)
    Full
  )
  $ onWorkspace wp12 (
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

    -- Layouts
    verticalDefault = (IfMax 2 (Tall 2 delta (1/2)) Full)

--------------------------------------------------------------------------------------------------------------------
------------------------------------------------Scratchpad-Settings-------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myScratchPads = [
  -- NS (WhatToExecute) (ProgramToExecute) (ClassName) (HowToManageWindow)
  NS "terminal" "termite" (resource =? "termite") manageTerm
  , NS "mpv" "mpv"  (className =? "mpv") manageTerm
  , NS "gnome-calculator" "gnome-calculator" (resource =? "gnome-calculator") manageTerm
  , NS "zoom" "us.zoom.Zoom" (resource =? "zoom") manageTerm
  , NS "video" "SVPManager" (resource =? "SVPManager") manageTerm
  , NS "passwords" "keepassxc" (resource =? "keepassxc") manageTerm
  ]
  where
    manageTerm = (customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3))
--------------------------------------------------------------------------------------------------------------------
-------------------------------------------------Status-Bar-Settings------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

myBar = "xmobar ~/.xmonad/xmobar.conf --wmclass=xmobar"

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
  spawn "exec= language en"
  spawn "exec= pkill stalonetray;stalonetray"
  spawn "exec= pkill picom;picom --experimental-backends &"
  spawn ("exec= xrandr --output " ++ primaryDisplay ++ " --primary")
  spawn "exec= xsetroot -cursor_name left_ptr"
  spawn "exec= pkill dunst;dunst &"
  spawn "exec= xset -dpms && xset s noblank && xset s off && xset b off"
  spawn "exec= ./.fehbg"

myManageHook = composeAll [

  className =? "Java"                                                 --> doFloat
  , className =? "Gpick"                                              --> doFloat
  , className =? "float"                                              --> doFloat
  , className =? "Termite"                                            --> doFloat
  , className =? "Gnome-calculator"                                   --> doFloat
  , className =? "KeePassXC"                                          --> doFloat
  
  -- Windows force
  , className =? "Chromium"                                           --> doShift wp0
  , className =? "MuseScore3"                                         --> doShift wp0
  ---
  , className =? "Alacritty"                                          --> doShift wp1
  ---
  , className =? "Emacs"                                              --> doShift wp2
  , className =? "code-oss"                                           --> doShift wp2
  , className =? "com.oracle.javafx.scenebuilder.app.SceneBuilderApp" --> doShift wp2
  , className =? "UnityHub"                                           --> doShift wp2
  , className =? "Unity"                                              --> doShift wp2
  ---
  , className =? "Evince"                                             --> doShift wp3
  , className =? "Com.github.babluboy.bookworm"                       --> doShift wp3
  , className =? "calibre"                                            --> doShift wp3
  ---
  , className =? "firefox"                                            --> doShift wp4
  , className =? "Tor Browser"                                        --> doShift wp4
  , className =? "qutebrowser"                                        --> doShift wp4
  ---
  , className =? "Org.gnome.Nautilus"                                 --> doShift wp5
  , className =? "VirtualBox Manager"                                 --> doShift wp5
  , className =? "Filezilla"                                          --> doShift wp5
  , className =? "aft-linux-qt"                                       --> doShift wp5
  , className =? "Gimp-2.10"                                          --> doShift wp5
  ---
  , className =? "libreoffice-startcenter"                            --> doShift wp6
  , className =? "libreoffice-writer"                                 --> doShift wp6
  , className =? "libreoffice"                                        --> doShift wp6
  ---
  , className =? "StardewValley.bin.x86_64"                           --> doShift wp7
  , className =? "minecraft-launcher"                                 --> doShift wp7
  , className =? "Minecraft 1.16.4"                                   --> doShift wp7
  , className =? "FML early loading progress"                         --> doShift wp7
  ---
  , className =? "scrcpy"                                             --> doShift wp8
  ---
  , className =? "Transmission-gtk"                                   --> doShift wp9
  ---
  , className =? "Syncthing GTK"                                      --> doShift wp10
  , className =? "Syncthing-gtk"                                      --> doShift wp10
  , className =? "Lxappearance"                                       --> doShift wp10
  , className =? "Blueberry.py"                                       --> doShift wp10
  , className =? "Pavucontrol"                                        --> doShift wp10
  ---
  , className =? "TelegramDesktop"                                    --> doShift wp11
  , className =? "discord"                                            --> doShift wp11
  , className =? "Slack"                                              --> doShift wp11
  ---
  , className =? ""                                                   --> doShift wp12
  , className =? "Rhythmbox"                                          --> doShift wp12
  ]
  
