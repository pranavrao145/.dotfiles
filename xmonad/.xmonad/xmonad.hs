import           XMonad

import           XMonad.Config.Kde

import           XMonad.Util.EZConfig
import           XMonad.Util.NamedScratchpad
import           XMonad.Util.Run
import           XMonad.Util.SpawnOnce

import           XMonad.Actions.CycleWS
import           XMonad.Actions.GridSelect
import           XMonad.Actions.OnScreen

import qualified XMonad.StackSet                     as W

import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers          hiding ((~?))
import           XMonad.Hooks.SetWMName

import           XMonad.Layout.Fullscreen
import           XMonad.Layout.MultiToggle
import           XMonad.Layout.MultiToggle.Instances
import           XMonad.Layout.NoBorders
import           XMonad.Layout.Reflect
import           XMonad.Layout.Spacing
import           XMonad.Layout.Spiral
import           XMonad.Layout.Tabbed
import           XMonad.Layout.ThreeColumns

import           Data.Bifunctor
import           Data.Char                           as DC
import           Data.List                           as DL
import qualified Data.Map                            as M
import           Data.Maybe

import           System.IO
import           System.IO.Unsafe

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

windowCount :: X (Maybe String)
windowCount =
    gets $
    Just .
    show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

-- string search operator
(~?) :: (Eq a, Functor m) => m [a] -> [a] -> m Bool
q ~? x = fmap (x `isInfixOf`) q

-- Utility functions end
myTerminal = "kitty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myFont :: String
myFont =
    "xft:JetBrainsMono Nerd Font Mono:regular:size=10:antialias=true:hinting=true"

myModMask = mod4Mask

myBorderWidth = 3

-- myWorkspaces = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
myWorkspaces =
    [ " dev "
    , " www "
    , " chat "
    , " mus "
    , " call "
    , " obs "
    , " med "
    , " misc "
    , " not "
    ]

myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1 ..] -- (,) == \x y -> (x,y)

clickable ws =
    "<action=xdotool key super+" ++ show i ++ ">" ++ ws ++ "</action>"
  where
    i = fromJust $ M.lookup ws myWorkspaceIndices

myNormalBorderColor = "#000000" -- no transparency :(

myFocusedBorderColor = fromXres "*color6"

myKeys =
    [ ( "M-d" , spawn "rofi -show drun")
    , ("M-p", windows $ greedyViewOnScreen 0 " dev ")
    , ("M-o", windows $ greedyViewOnScreen 0 " www ")
    , ("M-i", windows $ greedyViewOnScreen 0 " chat ")
    , ("M-u", windows $ greedyViewOnScreen 0 " mus ")
    , ("M-y", windows $ greedyViewOnScreen 0 " call ")
    , ("M-[", windows $ greedyViewOnScreen 0 " not ")
    , ("M-<Tab>", spawn "rofi -show window")
    , ("M-<Return>", windows (greedyViewOnScreen 0 " dev ") >> spawn "kitty")
    , ("M-S-f", spawn "kitty zsh -c '(cat ~/.cache/wal/sequences &) && ranger'")
    , ("M-S-<Return>", windows W.swapMaster)
    , ("M-<Space>", windows W.focusMaster)
    , ("M-S-<Space>", sendMessage NextLayout)
    , ("M-C-S-<Space>", setLayout $ XMonad.Layout myLayoutHook)
    , ("M-m", spawn "restart_spotify")
  -- , ("M-m", spawn "brave --start-fullscreen --profile-directory=Default open.spotify.com")
    , ("M-n", spawn "discord")
    , ("M-s", spawn "cpupower-gui")
    , ("M-z", spawn "firefox-developer-edition --new-window notion.so")
    , ( "M-c"
      , windows (greedyViewOnScreen 0 " www ") >>
        spawn "firefox-developer-edition")
    , ( "M-S-c"
      , windows (greedyViewOnScreen 0 " www ") >>
        spawn "brave --password-store=basic")
    , ("M-q", kill)
    , ("M-f", sendMessage (Toggle NBFULL))
    -- , ("M-S-i", spawn "sysinfo")
    , ("C-<Space>", spawn "dunstctl close")
    , ("<Control_L>-`", spawn "dunstctl history-pop")
    , ("C-S-.", spawn "dunstctl context")
    , ( "<XF86AudioRaiseVolume>"
      , spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
    , ( "<XF86AudioLowerVolume>"
      , spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
    , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ( "<XF86AudioMicMute>"
      , spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
    , ("<XF86MonBrightnessUp>", spawn "brightnessctl -c backlight set 10%+")
    , ("<XF86MonBrightnessDown>", spawn "brightnessctl -c backlight set 10%-")
    , ("<XF86AudioPlay>", spawn "playerctl play-pause")
    , ("<XF86AudioPause>", spawn "playerctl play-pause")
    , ("<XF86AudioNext>", spawn "playerctl next")
    , ("<XF86AudioPrev>", spawn "playerctl previous")
    , ("<XF86AudioStop>", spawn "playerctl stop")
    , ("M-S-s", spawn "flameshot gui")
    -- , ( "M-C-S-n"
    --   , spawn
    --         "nvidia_desktop && xrandr --output VIRTUAL1 --primary --auto --output eDP1 --auto --right-of VIRTUAL1 && nitrogen --restore")
    , ( "M-C-S-b"
      , spawn
            "xrandr --output HDMI-1-0 --same-as eDP-2 --auto --output eDP-2 --auto --primary")
    -- , ( "M-C-S-m"
    --   , spawn
    --         "pkill virtual && xrandr --output VIRTUAL1 --off --output eDP1 --auto --primary && nitrogen --restore")
    -- , ( "M-C-S-b"
    --   , spawn
    --         "nvidia_desktop && xrandr --output VIRTUAL1 --same-as eDP1 --auto --output eDP1 --auto --primary && nitrogen --restore")
    -- , ( "M-C-S-v"
    --   , spawn
    --         "nvidia_desktop && xrandr --output VIRTUAL1 --primary --auto --output eDP1 --off && nitrogen --restore")
    , ("M-S-r", spawn "xmonad --recompile && xmonad --restart")
    , ("M-S-p", spawn "pavucontrol")
    , ("M-C-l", shiftNextScreen >> nextScreen)
    , ("M-C-h", shiftPrevScreen >> prevScreen)
    , ("M-C-<Right>", shiftNextScreen >> nextScreen)
    , ("M-C-<Left>", shiftPrevScreen >> prevScreen)
    , ("M-S--", withFocused $ toggleDynamicNSP "scratch")
    , ("M--", dynamicNSPAction "scratch")
    -- , ("M-S-l", spawn "loginctl lock-session")
    , ("M-S-a", spawnSelected' gsGeneral)
    , ("M-S-q", spawn "sudo /usr/bin/restart-sddm") -- figure out what's going on here, this is garbage
    ]

myManageHook =
    composeAll
        [ className =? "kitty" --> doShift " dev "
        , className =? "Code" --> doShift " dev "
        , className =? "saturn" --> doShift " dev "
        , className =? "Brave-browser" --> doShift " www "
        , className =? "firefox" --> doShift " www "
        , className =? "firefoxdeveloperedition" --> doShift " www "
        , className =? "qutebrowser" --> doShift " www "
        , className =? "discord" --> doShift " chat "
        , className =? "Slack" --> doShift " chat "
        , className =? "Spotify" --> doShift " mus "
        , className =? "Chromium" --> doShift " call "
        , className =? "Microsoft Teams - Insiders" --> doShift " call "
        , className =? "zoom" --> doShift " call "
        , className =? "Skype" --> doShift " call "
        , className =? "obs" --> doShift " obs "
        , className =? "kdenlive" --> doShift " med "
        , className =? "Gimp-2.10" --> doShift " med "
        , className =? "Eclipse" --> doShift " misc "
        , className =? "jetbrains-pycharm-ce" --> doShift " misc "
        , className =? "jetbrains-idea-ce" --> doShift " misc "
        , className =? "jetbrains-idea" --> doShift " misc "
        , className =? "jetbrains-studio" --> doShift " misc "
        , className =? "Anydesk" --> doShift " not "
        , className =? "notion-app" --> doShift " not "
        , className =? "Nitrogen" --> doFloat
        , className =? "krunner" --> doFloat
        , className =? "plasmashell" --> hasBorder False
        , className =? "plasmashell" --> doFloat
        , className =? "krunner" --> hasBorder False
        , className =? "krunner" -->  doFloat
        , className =? "screenkey" --> doFloat
        , className =? "kdeconnect.daemon" --> doFloat
        , className =? "kdeconnect.daemon" --> hasBorder False
        ]

-- myHandleEventHook = dynamicPropertyChange "WM_CLASS"
-- myDynHook = composeAll [title =? "spotify" --> doShift " 4 "]
myStartupHook = do
    -- spawnOnce "nitrogen --restore"
    spawnOnce "dunst"
    spawn "setxkbmap -layout us -option ctrl:nocaps -option altwin:swap_alt_win"
    -- spawn
    --     "xsetwacom set \"Wacom Intuos S Pad pad\" Button 1 \"key +ctrl z -ctrl\""
    -- spawn
    --     "xsetwacom set \"Wacom Intuos S Pad pad\" Button 2 \"key +ctrl y -ctrl\""
    -- spawn "xsetwacom set \"Wacom Intuos S Pad pad\" Button 3 \"key pgup\""
    -- spawn "xsetwacom set \"Wacom Intuos S Pad pad\" Button 8 \"key pgdn\""
    -- spawn "xsetwacom set \"Wacom Intuos S Pen stylus\" Button 2 3"
    -- spawn "xsetwacom set \"Wacom Intuos S Pen stylus\" Button 3 \"key del\""
    -- spawn "mapwacom -d \"Wacom Intuos S Pen stylus\" -s \"HDMI1\""
    setWMName "LG3D"
    spawn "picom --experimental-backends &"
    -- spawn "picom --config ~/.config/picom/picom.conf"
    -- spawnOnce "nm-applet &"
    spawnOnce "xmodmap ~/.Xmodmap"
    spawnOnce "notify-send \"Notification daemon started\""
    -- spawnOnce "pkill -i picom"

mySpacing = spacingRaw False (Border 5 5 5 5) True (Border 5 5 5 5) True
myLayoutHook =
    lessBorders Screen $
    mkToggle (single NBFULL) $
    smartBorders $
    avoidStruts $
    reflectHoriz $
    mySpacing $
    Tall 1 (3 / 100) (2 / 3) |||
    Tall 1 (3 / 100) (1 / 2) |||
    ThreeColMid 1 (2 / 100) (1 / 2)

-- Grid Select
myNavigation :: TwoD a (Maybe a)
myNavigation = makeXEventhandler $ shadowWithKeymap navKeyMap navDefaultHandler
  where
    navKeyMap =
        M.fromList
            [ ((0, xK_Escape), cancel)
            , ((0, xK_Return), select)
            , ((0, xK_slash), substringSearch myNavigation)
            , ((0, xK_Left), move (-1, 0) >> myNavigation)
            , ((0, xK_h), move (-1, 0) >> myNavigation)
            , ((0, xK_Right), move (1, 0) >> myNavigation)
            , ((0, xK_l), move (1, 0) >> myNavigation)
            , ((0, xK_Down), move (0, 1) >> myNavigation)
            , ((0, xK_j), move (0, 1) >> myNavigation)
            , ((0, xK_Up), move (0, -1) >> myNavigation)
            , ((0, xK_k), move (0, -1) >> myNavigation)
            , ((0, xK_y), move (-1, -1) >> myNavigation)
            , ((0, xK_i), move (1, -1) >> myNavigation)
            , ((0, xK_n), move (-1, 1) >> myNavigation)
            , ((0, xK_m), move (1, -1) >> myNavigation)
            , ((0, xK_space), setPos (0, 0) >> myNavigation)
            ]
    navDefaultHandler = const myNavigation

myColorizer :: Window -> Bool -> X (String, String)
myColorizer =
    colorRangeFromClassName
        (0x28, 0x2c, 0x34) -- lowest inactive bg
        (0x28, 0x2c, 0x34) -- highest inactive bg
        (0xc7, 0x92, 0xea) -- active bg
        (0xc0, 0xa7, 0x9a) -- inactive fg
        (0x28, 0x2c, 0x34) -- active fg

-- gridSelect menu layout
mygridConfig :: p -> GSConfig Window
mygridConfig colorizer =
    (buildDefaultGSConfig myColorizer)
        { gs_cellheight = 40
        , gs_cellwidth = 200
        , gs_cellpadding = 6
        , gs_navigate = myNavigation
        , gs_originFractX = 0.5
        , gs_originFractY = 0.5
        , gs_font = myFont
        }

spawnSelected' :: [(String, String)] -> X ()
spawnSelected' lst = gridselect conf lst >>= flip whenJust spawn
  where
    conf =
        def
            { gs_cellheight = 40
            , gs_cellwidth = 180
            , gs_cellpadding = 6
            , gs_originFractX = 0.5
            , gs_originFractY = 0.5
            , gs_font = myFont
            }

runSelectedAction' :: GSConfig (X ()) -> [(String, X ())] -> X ()
runSelectedAction' conf actions = do
    selectedActionM <- gridselect conf actions
    case selectedActionM of
        Just selectedAction -> selectedAction
        Nothing             -> return ()

gsGeneral =
    [ ("Quercus", "firefox-developer-edition --new-window q.utoronto.ca")
    , ( "lofi"
      , "brave --new-window https://youtu.be/jfKfPfyJRdk")
    , ( "UToronto Email"
      , "firefox-developer-edition --new-window mail.utoronto.ca")
    , ( "Google Calendar"
      , "firefox-developer-edition --new-window calendar.google.com")
    , ("ChatGPT", "firefox-developer-edition --new-window chat.openai.com")
    , ("YouTube Search", "/usr/bin/search_youtube")
    , ("Gmail", "firefox-developer-edition --new-window mail.google.com")
    , ("YouTube", "firefox-developer-edition --new-window youtube.com")
    , ( "GitHub"
      , "firefox-developer-edition --new-window github.com/pranavrao145")
    , ("Whatsapp", "firefox-developer-edition --new-window web.whatsapp.com")
    , ( "Instagram"
      , "firefox-developer-edition --new-window https://www.instagram.com/direct/inbox/")
    , ("Netflix", "firefox-developer-edition --new-window netflix.com")
    ]

main
    -- xmproc <- spawnPipe "xmobar /home/cypher/.config/xmobar/xmobarrc0 -x 0"
    -- xmproc1 <- spawnPipe "xmobar /home/cypher/.config/xmobar/xmobarrc1 -x 1"
 = do
    xmonad $
        ewmh $
        docks $
        kdeConfig
            { terminal = myTerminal
            , focusFollowsMouse = myFocusFollowsMouse
            , borderWidth = myBorderWidth
            , modMask = myModMask
            , workspaces = myWorkspaces
            , normalBorderColor = myNormalBorderColor
            , focusedBorderColor = myFocusedBorderColor
            , layoutHook = myLayoutHook
            , manageHook = myManageHook
            -- , handleEventHook = myHandleEventHook
            , startupHook = myStartupHook
            , logHook =
                  dynamicLogWithPP $
                  filterOutWsPP ["scratch"] $
                  xmobarPP
                        -- ppOutput =
                            -- \x -> hPutStrLn xmproc x >> hPutStrLn xmproc1 x
                      { ppOrder = \(ws:l:t:ex) -> [ws, t] ++ ex
                          , ppTitle = xmobarColor "#A1A3A7" "" . shorten 30
                      , ppCurrent =
                                xmobarColor "#A1A3A7" "" . -- ppCurrentColorMarker1
                            wrap
                                    "<box type=Bottom width=2 mb=2 color=#A1A3A7>" -- ppCurrentColorMarker2
                                "</box>"
                      , ppVisible =
                            wrap
                                "<box type=Bottom width=2 mb=2 color=#FFFFFF>"
                                "</box>" .
                            clickable
                      , ppHidden = clickable
                      }
            } `additionalKeysP`
        myKeys
