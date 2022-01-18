new_name=$(rofi -steal-focus -l 0 -p 'new desktop name' -dmenu -theme-str 'window {width:10%;}entry{placeholder:"";}inputbar{children:[prompt,textbox-prompt-colon,entry];}')
if [ $new_name ]
then
    bspc desktop -n "[$new_name]"
fi
