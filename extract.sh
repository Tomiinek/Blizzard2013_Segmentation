mkdir -p audios/emma
mkdir -p audios/mansfield_park
mkdir -p audios/persuasion
mkdir -p audios/pride_and_prejudice
mkdir -p audios/sense_and_sensibility
mkdir -p audios/the_emerald_city_of_oz
mkdir -p audios/the_patchwork_girl_of_oz
mkdir -p audios/a_little_princess
mkdir -p audios/the_secret_garden
mkdir -p audios/through_the_looking_glass
mkdir -p audios/the_awakening
mkdir -p audios/silas_marner
mkdir -p audios/a_room_with_a_view
mkdir -p audios/far_from_the_madding_crowd
mkdir -p audios/the_scarlet_letter
mkdir -p audios/the_gift_of_the_magi
mkdir -p audios/daisy_miller
mkdir -p audios/washington_square
mkdir -p audios/the_jungle_book
mkdir -p audios/carmilla
mkdir -p audios/black_beauty
mkdir -p audios/treasure_island
mkdir -p audios/ethan_frome
mkdir -p audios/madame_de_treymes
mkdir -p audios/summer
mkdir -p audios/the_velveteen_rabbit
mv train/unsegmented/jane_austen/emma/* audios/emma
mv train/unsegmented/jane_austen/mansfield_park/* audios/mansfield_park
mv train/unsegmented/jane_austen/persuasion/* audios/persuasion
mv train/unsegmented/jane_austen/pride_and_prejudice/* audios/pride_and_prejudice
mv train/unsegmented/jane_austen/sense_and_sensibility/* audios/sense_and_sensibility
mv train/unsegmented/young_readers/the_emerald_city_of_oz_and_the_patchwork_girl_of_oz/the_emerald_city_of_oz/* audios/the_emerald_city_of_oz
mv train/unsegmented/young_readers/the_emerald_city_of_oz_and_the_patchwork_girl_of_oz/the_patchwork_girl_of_oz/* audios/the_patchwork_girl_of_oz
mv train/unsegmented/young_readers/a_little_princess/* audios/a_little_princess
mv train/unsegmented/young_readers/the_secret_garden/* audios/the_secret_garden
mv train/unsegmented/young_readers/wizard_of_oz_alice_in_wonderland_throughthe_looking_glass/through_the_looking_glass/* audios/through_the_looking_glass
mv train/unsegmented/womens_classics/the_awakening_and_all_kate_chopin_stories/the_awakening/* audios/the_awakening
mv train/unsegmented/womens_classics/silas_marner/* audios/silas_marner
mv train/unsegmented/classic_novels/a_room_with_a_view/* audios/a_room_with_a_view
mv train/unsegmented/womens_classics/far_from_the_madding_crowd/* audios/far_from_the_madding_crowd
mv train/unsegmented/classic_novels/the_scarlet_letter/* audios/the_scarlet_letter
mv train/unsegmented/christmas/christmas_stories/the_gift_of_the_magi/* audios/the_gift_of_the_magi
mv train/unsegmented/classic_novels/daisy_miller_and_the_turn_of_the_screw/daisy_miller/* audios/daisy_miller
mv train/unsegmented/classic_novels/washington_square/* audios/washington_square
mv train/unsegmented/young_readers/the_jungle_books/the_jungle_book/* audios/the_jungle_book
mv train/unsegmented/thriller_mytery/mysteries/carmilla/* audios/carmilla
mv train/unsegmented/young_readers/black_beauty/* audios/black_beauty
mv train/unsegmented/adventure_and_science_fiction/treasure_island/* audios/treasure_island
mv train/unsegmented/womens_classics/ethan_frome_and_madame_de_treymes_and_the_other_two/ethan_frome/* audios/ethan_frome
mv train/unsegmented/womens_classics/ethan_frome_and_madame_de_treymes_and_the_other_two/madame_de_treymes/* audios/madame_de_treymes
mv train/unsegmented/womens_classics/summer_and_roman_fever/summer/* audios/summer
mv train/unsegmented/children/peter_rabbit_collected_and_the_velveteen_rabbit/the_velveteen_rabbit/* audios/the_velveteen_rabbit

rm -rf train/

cd audios/

for D in */; do
    echo "Processing ${D}"
    cd "${D}"
    ls -v | cat -n | while read n f; do mv "$f" `printf "%02d.mp3" $n`; done
    for f in $(ls); do ffmpeg -y -loglevel panic -i $f ${f%.*}.wav; done
    rm -f *.mp3
    cd - > /dev/null
done

rm -f ethan_frome/10.wav ethan_frome/11.wav
rm -f the_jungle_book/02.wav the_jungle_book/03.wav
rm -f the_patchwork_girl_of_oz/28.wav
rm -f through_the_looking_glass/10.wav

cd ../

