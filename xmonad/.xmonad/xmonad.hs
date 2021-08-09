import XMonad
 
import XMonad.Config.Desktop

import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad

import XMonad.Actions.OnScreen
import XMonad.Util.NamedScratchpad

import qualified XMonad.StackSet as W

import XMonad.Hooks.DynamicProperty
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Fullscreen
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances

import Data.Maybe
import Data.Bifunctor
import Data.List as DL
import Data.Char as DC
import qualified Data.Map as M

import System.IO
import System.IO.Unsafe

-- Utility functions begin

getFromXres :: String -> IO String
getFromXres key = fromMaybe "" . findValue key <$> runProcessWithInput "xrdb" ["-query"] ""
  where
    findValue :: String -> String -> Maybe String
    findValue xresKey xres =
      snd <$> (
                DL.find ((== xresKey) . fst)
                $ catMaybes
                $ splitAtColon
                <$> lines xres
              )

    splitAtColon :: String -> Maybe (String, String)
    splitAtColon str = splitAtTrimming str <$> (DL.elemIndex ':' str)

    splitAtTrimming :: String -> Int -> (String, String)
    splitAtTrimming str idx = bimap trim trim . (second tail) $ splitAt idx str

    trim :: String -> String
    trim = DL.dropWhileEnd (DC.isSpace) . DL.dropWhile (DC.isSpace)

fromXres :: String -> String
fromXres = unsafePerformIO . getFromXres

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
tabConfig = defaultTheme {
    activeBorderColor = fromXres "*color6",
    activeTextColor = fromXres "*color7",
    activeColor = fromXres "*color6",
    inactiveBorderColor = fromXres "*color2",
    inactiveTextColor = fromXres "*color7",
    inactiveColor = fromXres "*color2",
    fontName = "xft:JetBrainsMonoMedium Nerd Font Mono:size=12"
}

clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
    where i = fromJust $ M.lookup ws myWorkspaceIndices

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

-- Utility functions end

myTerminal = "alacritty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myModMask       = mod4Mask

myBorderWidth = 1

myWorkspaces = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..] -- (,) == \x y -> (x,y)

myNormalBorderColor  = "*color2"
myFocusedBorderColor = fromXres "*color6"

myKeys = 
    [
    ("M-d", spawn "rofi -show drun -modi drun -location 1 -width 100 -lines 2 -line-margin 0 -line-padding 1 -separator-style none -font \"JetBrainsMonoMedium Nerd Font Mono 10\" -columns 9 -bw 0 -disable-history -hide-scrollbar -show-icons -kb-row-select \"Tab\" -kb-row-tab \"\""),

    ("M-p", windows $ W.greedyView " 1 "),
    ("M-o", windows $ W.greedyView " 2 "),
    ("M-i", windows $ W.greedyView " 3 "),
    ("M-u", windows $ W.greedyView " 4 "),
    ("M-y", windows $ W.greedyView " 5 "),

    ("M-c", spawn "brave"),

    ("M-q", kill),

    ("M-f", sendMessage $ Toggle NBFULL), 

    ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%"), 
    ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%"), 
    ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"), 
    ("<XF86AudioMicMute>", spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle"), 

    ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 20"), 
    ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 20"), 

    ("<XF86AudioPlay>", spawn "playerctl play-pause"), 
    ("<XF86AudioPause>", spawn "playerctl play-pause"), 
    ("<XF86AudioNext>", spawn "playerctl next"), 
    ("<XF86AudioPrev>", spawn "playerctl previous"), 
    ("<XF86AudioStop>", spawn "playerctl stop"), 

    ("M-S-n", spawn "xrandr --output eDP1 --mode 1280x720 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"),
    ("M-S-m", spawn "xrandr --output eDP1 --primary --mode 1280x720 --pos 0x0 --rotate normal --output HDMI1 --off --output VIRTUAL1 --off"),
    ("M-S-r", spawn "xmonad --recompile && xmonad --restart")
    ]

myManageHook = composeAll
    [
        className =? "Alacritty" --> doShift " 1 ",
        className =? "Brave-browser" --> doShift " 2 ",
        className =? "discord" --> doShift " 3 ",
        className =? "VirtualBox Manager" --> doShift " 5 ",
        className =? "obs" --> doShift " 6 ",
        className =? "vlc" --> doShift " 7 ",
        className =? "kdenlive" --> doShift " 7 ",
        className =? "Gimp-2.10" --> doShift " 7 ",
        className =? "Microsoft Teams - Insiders" --> doShift " 8 ",
        className =? "Skype" --> doShift " 8 ",
        className =? "zoom" --> doShift " 8 ",
        className =? "Thunar" --> doShift " 9 ",

        className =? "Nitrogen" --> doFloat
    ]

myHandleEventHook = dynamicPropertyChange "WM_CLASS" myDynHook

myDynHook = composeAll [
    title =? "Spotify" --> doShift " 4 ",
    title =? "VirtualBox Machine" --> doShift " 5 "
    ]

myStartupHook = do
    --spawn "$HOME/.config/polybar/scripts/launch_xmonad.sh"
    spawnOnce "alacritty &"
    spawnOnce "brave &"
    spawnOnce "discord &"
    spawnOnce "spotify &"
    spawnOnce "picom --experimental-backends &"
    spawnOnce "nitrogen --restore"
    spawnOnce "xrandr --output eDP1 --mode 1280x720 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"

myLayoutHook = avoidStruts (
    ThreeColMid 1 (3/100) (1/2) |||
    Tall 1 (3/100) (1/2) |||
    Mirror (Tall 1 (3/100) (1/2)) |||
    tabbed shrinkText tabConfig |||
    spiral (6/7))

main = do
    xmproc0 <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc"
    xmproc1 <- spawnPipe "xmobar -x 1 $HOME/.config/xmobar/xmobarrc"
    xmonad $ docks $ ewmh desktopConfig {
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        -- numlockMask deprecated in 0.9.1
        -- numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

        -- hooks, layouts
        layoutHook         = spacingRaw False (Border 0 10 0 10) True (Border 10 0 10 0) True $ mkToggle (single NBFULL) $ myLayoutHook,
        manageHook         = myManageHook,
        handleEventHook    = myHandleEventHook,
        startupHook        = myStartupHook,
        logHook = dynamicLogWithPP $ namedScratchpadFilterOutWorkspacePP $ xmobarPP
              -- the following variables beginning with 'pp' are settings for xmobar.
              { ppOutput = \x -> hPutStrLn xmproc0 x                          -- xmobar on monitor 1
                              >> hPutStrLn xmproc1 x                          -- xmobar on monitor 2
              , ppCurrent = xmobarColor (fromXres "*color7") "" . wrap "<box type=Bottom width=2 color=#c792ea>" "</box>"         -- Current workspace
              , ppVisible = xmobarColor (fromXres "*color7")"" . clickable              -- Visible but not current workspace
              , ppHidden = xmobarColor "#82AAFF" "" . wrap "<box type=Top width=2 color=#82AAFF>" "</box>" . clickable -- Hidden workspaces
              , ppHiddenNoWindows = xmobarColor "#82AAFF" ""  . clickable     -- Hidden workspaces (no windows)
              , ppTitle = xmobarColor "#b3afc2" "" . shorten 60               -- Title of active window
              , ppSep =  "<fc=#666666> <fn=1>|</fn> </fc>"                    -- Separator character
              , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"            -- Urgent workspace
              , ppExtras  = [windowCount]                                     -- # of windows current workspace
              , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]                    -- order of things in xmobar
              }
    } `additionalKeysP` myKeys

