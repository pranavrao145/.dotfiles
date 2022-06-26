import XMonad

import XMonad.Config.Desktop

import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

import XMonad.Actions.CycleWS
import XMonad.Actions.OnScreen

import qualified XMonad.StackSet as W

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.DynamicProperty
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName

import XMonad.Layout.Fullscreen
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders
import XMonad.Layout.Reflect
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns

import Data.Bifunctor
import Data.Char as DC
import Data.List as DL
import qualified Data.Map as M
import Data.Maybe

import System.IO
import System.IO.Unsafe

-- Utility functions begin
getFromXres :: String -> IO String
getFromXres key =
  fromMaybe "" . findValue key <$> runProcessWithInput "xrdb" ["-query"] ""
  where
    findValue :: String -> String -> Maybe String
    findValue xresKey xres =
      snd <$>
      (DL.find ((== xresKey) . fst) $ catMaybes $ splitAtColon <$> lines xres)
    splitAtColon :: String -> Maybe (String, String)
    splitAtColon str = splitAtTrimming str <$> (DL.elemIndex ':' str)
    splitAtTrimming :: String -> Int -> (String, String)
    splitAtTrimming str idx = bimap trim trim . (second tail) $ splitAt idx str
    trim :: String -> String
    trim = DL.dropWhileEnd (DC.isSpace) . DL.dropWhile (DC.isSpace)

fromXres :: String -> String
fromXres = unsafePerformIO . getFromXres

clickable ws =
  "<action=xdotool key super+" ++ show i ++ ">" ++ ws ++ "</action>"
  where
    i = fromJust $ M.lookup ws myWorkspaceIndices

windowCount :: X (Maybe String)
windowCount =
  gets $
  Just .
  show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

-- Utility functions end
myTerminal = "kitty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myModMask = mod4Mask

myBorderWidth = 1

myWorkspaces = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]

myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1 ..] -- (,) == \x y -> (x,y)

myNormalBorderColor = fromXres "*color2"

myFocusedBorderColor = fromXres "*color6"

myKeys =
  [ ( "M-d"
    , spawn
        "rofi -show drun -modi drun -location 1 -width 100 -lines 2 -line-margin 0 -line-padding 1 -separator-style none -font \"JetBrainsMonoMedium Nerd Font Mono 10\" -columns 9 -bw 0 -disable-history -hide-scrollbar -show-icons -kb-row-select \"Tab\" -kb-row-tab \"\"")
  , ("M-p", windows $ greedyViewOnScreen 0 " 1 ")
  , ("M-o", windows $ greedyViewOnScreen 0 " 2 ")
  , ("M-i", windows $ greedyViewOnScreen 0 " 3 ")
  , ("M-u", windows $ greedyViewOnScreen 0 " 4 ")
  , ("M-y", windows $ greedyViewOnScreen 0 " 5 ")
  , ("M-[", windows $ greedyViewOnScreen 0 " 9 ")
  , ("M-<Tab>", spawn "rofi -show window")
  , ("M-<Return>", windows (greedyViewOnScreen 0 " 1 ") >> spawn "kitty")
  , ("M-t", windows (greedyViewOnScreen 0 " 1 ") >> spawn "kitty -e ranger")
  , ("M-S-<Return>", windows W.swapMaster)
  , ("M-<Space>", windows W.focusMaster)
  , ("M-S-<Space>", sendMessage NextLayout)
  , ("M-C-S-<Space>", setLayout $ XMonad.Layout myLayoutHook)
  , ("M-m", spawn "restart_spotify")
  , ("M-n", spawn "discord")
  , ("M-z", spawn "notion-app")
  -- , ("M-c", windows (greedyViewOnScreen 0 " 2 ") >> spawn "brave")
  , ( "M-c"
    , windows (greedyViewOnScreen 0 " 2 ") >>
      spawn "qutebrowser-profile --new personal")
  , ( "M-S-c"
    , windows (greedyViewOnScreen 0 " 2 ") >>
      spawn "qutebrowser-profile --new university")
  , ("M-q", kill)
  , ("M-f", sendMessage (Toggle NBFULL) >> sendMessage ToggleStruts)
  , ("M-S-i", spawn "sysinfo")
  , ("C-<Space>", spawn "dunstctl close")
  , ("<Control_L>-`", spawn "dunstctl history-pop")
  , ("C-S-.", spawn "dunstctl context")
  , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
  , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
  , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
  , ( "<XF86AudioMicMute>"
    , spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
  , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 20")
  , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 20")
  , ("<XF86AudioPlay>", spawn "playerctl play-pause")
  , ("<XF86AudioPause>", spawn "playerctl play-pause")
  , ("<XF86AudioNext>", spawn "playerctl next")
  , ("<XF86AudioPrev>", spawn "playerctl previous")
  , ("<XF86AudioStop>", spawn "playerctl stop")
  , ("M-S-s", spawn "flameshot gui")
  , ( "M-C-S-n"
    , spawn
        "xrandr --output eDP1 --mode 1280x720 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off && nitrogen --restore && picom --experimental-backends &")
  , ( "M-C-S-m"
    , spawn
        "xrandr --output eDP1 --primary --mode 1280x720 --pos 0x0 --rotate normal --output HDMI1 --off --output VIRTUAL1 --off && nitrogen --restore && picom --experimental-backends &")
  , ("M-S-r", spawn "xmonad --recompile && xmonad --restart")
  , ("M-S-p", spawn "pavucontrol")
  , ("M-C-l", shiftNextScreen >> nextScreen)
  , ("M-C-h", shiftPrevScreen >> prevScreen)
  , ("M-C-<Right>", shiftNextScreen >> nextScreen)
  , ("M-C-<Left>", shiftPrevScreen >> prevScreen)
  , ("M-S-l", spawn "lock")
  ]

myManageHook =
  composeAll
    [ className =? "kitty" --> doShift " 1 "
    , className =? "Code" --> doShift " 1 "
    , className =? "Brave-browser" --> doShift " 2 "
    , className =? "qutebrowser" --> doShift " 2 "
    , className =? "discord" --> doShift " 3 "
    , className =? "Slack" --> doShift " 3 "
    , className =? "Chromium" --> doShift " 5 "
    , className =? "Microsoft Teams - Insiders" --> doShift " 5 "
    , className =? "zoom" --> doShift " 5 "
    , className =? "Skype" --> doShift " 5 "
    , className =? "obs" --> doShift " 6 "
    , className =? "kdenlive" --> doShift " 7 "
    , className =? "Gimp-2.10" --> doShift " 7 "
    , className =? "Eclipse" --> doShift " 8 "
    , className =? "notion-app" --> doShift " 9 "
    , className =? "Nitrogen" --> doFloat
    ]

myHandleEventHook = dynamicPropertyChange "WM_CLASS" myDynHook

myDynHook = composeAll [title =? "Spotify" --> doShift " 4 "]

myStartupHook = do
  spawnOnce "nitrogen --restore"
  spawnOnce "xmodmap -e 'keycode 135 = Super_R' && xset -r 135"
  spawn
    "xsetwacom set \"Wacom Intuos S Pad pad\" Button 1 \"key +ctrl z -ctrl\""
  spawn
    "xsetwacom set \"Wacom Intuos S Pad pad\" Button 2 \"key +ctrl y -ctrl\""
  spawn "xsetwacom set \"Wacom Intuos S Pad pad\" Button 3 \"key pgup\""
  spawn "xsetwacom set \"Wacom Intuos S Pad pad\" Button 8 \"key pgdn\""
  spawn "xsetwacom set \"Wacom Intuos S Pen stylus\" Button 2 3"
  spawn "xsetwacom set \"Wacom Intuos S Pen stylus\" Button 3 \"key del\""
  spawn "mapwacom -d \"Wacom Intuos S Pen stylus\" -s \"HDMI1\""
  setWMName "LG3D"
  spawn "picom --experimental-backends &"
  spawnOnce "sysinfo"

myLayoutHook =
  lessBorders Screen $
  mkToggle (single NBFULL) $
  smartBorders $
  avoidStruts $
  reflectHoriz $
  Tall 1 (3 / 100) (2 / 3) |||
  Tall 1 (3 / 100) (1 / 2) ||| ThreeColMid 1 (2 / 100) (1 / 2)

-- mySpacing = spacingRaw False (Border 5 5 5 5) True (Border 2 2 2 2) True
main
  -- xmproc <- spawnPipe "xmobar -x 0"
  -- xmproc1 <- spawnPipe "xmobar -x 1"
 = do
  xmonad $
    docks $
    ewmh
      desktopConfig
        { terminal = myTerminal
        , focusFollowsMouse = myFocusFollowsMouse
        , borderWidth = myBorderWidth
        , modMask = myModMask
        , workspaces = myWorkspaces
        , normalBorderColor = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , layoutHook = myLayoutHook
        , manageHook = myManageHook
        , handleEventHook = myHandleEventHook
        , startupHook = myStartupHook
        -- , logHook =
        --     dynamicLogWithPP
        --       xmobarPP
        --         {ppOutput = \x -> hPutStrLn xmproc x >> hPutStrLn xmproc1 x}
        } `additionalKeysP`
    myKeys
