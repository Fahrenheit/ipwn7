#!/bin/sh
#
# Examlple of using options in scripts
#

if [ $# -eq 0 ]
then
        echo "Missing options!"
        echo "(run $0 -h for help)"
        echo ""
        exit 0
fi

ECHO="false"
RED='\033[0;31m'
UDID=
OUTPUT="$(ls -1)"
thefile=$(ls -t | head -n 1)

#echo "${OUTPUT}"

while getopts "hejrcvp" OPTION; do
        case $OPTION in

                e)
                        ECHO="true"
                        ;;


                                        h)
                                                clear
                                                echo "$(tput setaf 1)ios7 Instaler for ipod touch 4g (macOS Version)"
                                                echo "$(tput setaf 2)Version 2.0.4 - tool by @sh0cks3ven"
                                                echo "We are not help responsable for anything that happens to your device"
                                                echo "Run Step 1 then restore with ios 7.1.2 ipsw once itunes opens"
                                                echo "Then run Step 2 and the device should boot (Need to run everytime to turn on)"
                                                echo "More help in the README.txt file"
                                                echo ""
                                                echo " $(tput setaf 1) -r   $(tput setaf 2)Install requirements and prepare for restore (Step 1)"
                                                echo " $(tput setaf 1) -j   $(tput setaf 2)Just boot the device (Step 2)"
                                                echo " $(tput setaf 1) -p   $(tput setaf 2)Just prepare for restore"
                                                echo " $(tput setaf 1) -c   $(tput setaf 2)View Credits"
                                                echo " $(tput setaf 1) -v   $(tput setaf 2)View README File"
                                                echo " $(tput setaf 1) -h   $(tput setaf 2)help (this output)"

                                                exit 0
                                                ;;

                                        j)
                                        clear
                                        echo "When the second Terminal windows pops up enter your password and hit enter"
                                        read -p "First put device into dfu mode and press enter to continue"
                                        cd ~/Desktop/ipwn7/ipwndfu
                                        python ./ipwndfu -p
                                        read -p "Waiting for device..." -t 6
                                        osascript -e 'tell application "Terminal" to do script "cd ~/Desktop/ipwn7/KeysServer && sudo python -m SimpleHTTPServer 80;"'
                                        read -p "Press Enter when TTS Server is started"
                                        cd futurerestore/
                                        ./futurerestore --use-pwndfu --just-boot="-v" ~/Desktop/ipwn7/iPod4,1_7.1.2_11D257_Boot.ipsw
                                        read -p "Sending iBBS and iBEC please wait..." -t 2
                                        echo ""
                                        echo "Rebooting device..."
                                        echo "Done :) Device should be booting! (If not check readme for help)"
                                        ;;


                                        r)
                                        clear
                                          cd ~/Desktop/ipwn7
                                          read -p "When brew promts you to install xcode tools check yes let it run unless told otherwise."
                                          read -p "." -t 2
                                          read -p "Put device into dfu mode and close itunes, press enter to continue"
                                          /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
                                          read -p "waiting on brew..." -t 1
                                          osascript -e 'tell application "Terminal" to do script "cd ~/Desktop/ipwndfu && brew install libusb && brew install python"'
                                          read -p "Press Enter when brew is done in the second Terminal window"
                                          read -p "waiting..." -t 1
                                          osascript -e 'tell application "Terminal" to do script "cd ~/Desktop/ipwndfu && pip3 install pyusb"'
                                          read -p "Press Enter when pip is done in the second Terminal window"
                                          read -p "waiting..." -t 1
                                          read -p "Close the 2 other Terminal windows and press enter when done."
                                          read -p "Waiting on device..." -t 1
                                          cd ipwndfu/
                                          python ./ipwndfu -p
                                          read -p "Itunes will now open please hold option and click restore and select the ios 7 ipsw. Press enter when ready"
                                          open -a iTunes
                                          echo "Going to main menu follow step 2 after you restore"
                                          cd ../
                                          ./ipwn7.sh -h
                                          ;;


                                        c)
                                          clear
                                          echo "Apple, iPhone, iPod, and iPod Touch are trademarks of Apple Inc."
                                          echo "ipwn7 is an independent software tool and has not been"
                                          echo "authorized, sponsored, or otherwise approved by Apple Inc."
                                          echo ""
                                          echo "@Ralph0045 for the ios7 ipsw and all his work with this!"
                                          echo "axi0mX for ipwndfu"
                                          echo "geohot for limera1n exploit"
                                          echo "posixninja and pod2g for SHAtter exploit"
                                          echo "@tihmstar - for futurerestore"
                                          echo "@albyvar25 - for the WI-Fi driver fix"
                                          echo "@iH8sn0w - for iFaith"
                                          echo "iPhone Dev Team for 24Kpwn exploit"
                                          echo "pod2g for steaks4uce exploit"
                                          echo "walac for pyusb"
                                          read -p "Press enter to go back to main menu"
                                          ./ipwn7.sh -h
                                          ;;

                                          v)
                                          clear
                                          open README.txt
                                          read -p "" -t 1
                                          clear
                                          cd ~/Desktop/ipwn7
                                          ./ipwn7.sh -h
                                          ;;




                                          p)
                                            clear
                                            echo "Just getting device ready for restore please wait..."
                                            read -p "." -t 1
                                            read -p "." -t 1
                                            read -p "." -t 1
                                            echo ""
                                            cd ipwndfu/
                                            python ./ipwndfu -p
                                            read -p "Itunes will now open please hold option and click restore and select the ios 7 ipsw. Press enter when ready"
                                            open -a iTunes
                                            echo "Going to main menu follow step 2 after you restore"
                                            cd ../
                                            ./ipwn7.sh -h
                                            ;;










                                esac
                        done

                        if [ $ECHO = "true" ]
                        then
                                echo "Hello world";
                        fi
