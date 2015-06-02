#!/bin/bash
./no_sil_align.pl -u morpheme -f kanji -r all.ref test_all.hyp >test_all.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_clean.hyp >test_clean.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_expressway_snr-5.hyp >test_expressway_snr-5.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_expressway_snr0.hyp >test_expressway_snr0.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_expressway_snr5.hyp >test_expressway_snr5.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_expressway_snr10.hyp >test_expressway_snr10.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_expressway_snr15.hyp >test_expressway_snr15.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_expressway_snr20.hyp >test_expressway_snr20.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_cityroad_snr-5.hyp >test_cityroad_snr-5.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_cityroad_snr0.hyp >test_cityroad_snr0.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_cityroad_snr5.hyp >test_cityroad_snr5.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_cityroad_snr10.hyp >test_cityroad_snr10.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_cityroad_snr15.hyp >test_cityroad_snr15.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_cityroad_snr20.hyp >test_cityroad_snr20.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio_snr-5.hyp >test_audio_snr-5.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio_snr0.hyp >test_audio_snr0.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio_snr5.hyp >test_audio_snr5.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio_snr10.hyp >test_audio_snr10.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio_snr15.hyp >test_audio_snr15.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio_snr20.hyp >test_audio_snr20.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-expressway_snr-5.hyp >test_audio-expressway_snr-5.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-expressway_snr0.hyp >test_audio-expressway_snr0.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-expressway_snr5.hyp >test_audio-expressway_snr5.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-expressway_snr10.hyp >test_audio-expressway_snr10.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-expressway_snr15.hyp >test_audio-expressway_snr15.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-expressway_snr20.hyp >test_audio-expressway_snr20.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-cityroad_snr-5.hyp >test_audio-cityroad_snr-5.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-cityroad_snr0.hyp >test_audio-cityroad_snr0.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-cityroad_snr5.hyp >test_audio-cityroad_snr5.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-cityroad_snr10.hyp >test_audio-cityroad_snr10.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-cityroad_snr15.hyp >test_audio-cityroad_snr15.ali
./no_sil_align.pl -u morpheme -f kanji -r audio.ref test_audio-cityroad_snr20.hyp >test_audio-cityroad_snr20.ali
./myscore.pl test_all.ali
./myscore.pl test_clean.ali
./myscore.pl test_expressway_snr-5.ali
./myscore.pl test_expressway_snr0.ali
./myscore.pl test_expressway_snr5.ali
./myscore.pl test_expressway_snr10.ali
./myscore.pl test_expressway_snr15.ali
./myscore.pl test_expressway_snr20.ali
./myscore.pl test_cityroad_snr-5.ali
./myscore.pl test_cityroad_snr0.ali
./myscore.pl test_cityroad_snr5.ali
./myscore.pl test_cityroad_snr10.ali
./myscore.pl test_cityroad_snr15.ali
./myscore.pl test_cityroad_snr20.ali
./myscore.pl test_audio_snr-5.ali
./myscore.pl test_audio_snr0.ali
./myscore.pl test_audio_snr5.ali
./myscore.pl test_audio_snr10.ali
./myscore.pl test_audio_snr15.ali
./myscore.pl test_audio_snr20.ali
./myscore.pl test_audio-expressway_snr-5.ali
./myscore.pl test_audio-expressway_snr0.ali
./myscore.pl test_audio-expressway_snr5.ali
./myscore.pl test_audio-expressway_snr10.ali
./myscore.pl test_audio-expressway_snr15.ali
./myscore.pl test_audio-expressway_snr20.ali
./myscore.pl test_audio-cityroad_snr-5.ali
./myscore.pl test_audio-cityroad_snr0.ali
./myscore.pl test_audio-cityroad_snr5.ali
./myscore.pl test_audio-cityroad_snr10.ali
./myscore.pl test_audio-cityroad_snr15.ali
./myscore.pl test_audio-cityroad_snr20.ali
mv test_all.* test_all.ali.scr/
mv test_clean.* test_clean.ali.scr/
mv test_expressway_snr-5.* test_expressway_snr-5.ali.scr/
mv test_expressway_snr0.* test_expressway_snr0.ali.scr/
mv test_expressway_snr5.* test_expressway_snr5.ali.scr/
mv test_expressway_snr10.* test_expressway_snr10.ali.scr/
mv test_expressway_snr15.* test_expressway_snr15.ali.scr/
mv test_expressway_snr20.* test_expressway_snr20.ali.scr/
mv test_cityroad_snr-5.* test_cityroad_snr-5.ali.scr/
mv test_cityroad_snr0.* test_cityroad_snr0.ali.scr/
mv test_cityroad_snr5.* test_cityroad_snr5.ali.scr/
mv test_cityroad_snr10.* test_cityroad_snr10.ali.scr/
mv test_cityroad_snr15.* test_cityroad_snr15.ali.scr/
mv test_cityroad_snr20.* test_cityroad_snr20.ali.scr/
mv test_audio_snr-5.* test_audio_snr-5.ali.scr/
mv test_audio_snr0.* test_audio_snr0.ali.scr/
mv test_audio_snr5.* test_audio_snr5.ali.scr/
mv test_audio_snr10.* test_audio_snr10.ali.scr/
mv test_audio_snr15.* test_audio_snr15.ali.scr/
mv test_audio_snr20.* test_audio_snr20.ali.scr/
mv test_audio-expressway_snr-5.* test_audio-expressway_snr-5.ali.scr/
mv test_audio-expressway_snr0.* test_audio-expressway_snr0.ali.scr/
mv test_audio-expressway_snr5.* test_audio-expressway_snr5.ali.scr/
mv test_audio-expressway_snr10.* test_audio-expressway_snr10.ali.scr/
mv test_audio-expressway_snr15.* test_audio-expressway_snr15.ali.scr/
mv test_audio-expressway_snr20.* test_audio-expressway_snr20.ali.scr/
mv test_audio-cityroad_snr-5.* test_audio-cityroad_snr-5.ali.scr/
mv test_audio-cityroad_snr0.* test_audio-cityroad_snr0.ali.scr/
mv test_audio-cityroad_snr5.* test_audio-cityroad_snr5.ali.scr/
mv test_audio-cityroad_snr10.* test_audio-cityroad_snr10.ali.scr/
mv test_audio-cityroad_snr15.* test_audio-cityroad_snr15.ali.scr/
mv test_audio-cityroad_snr20.* test_audio-cityroad_snr20.ali.scr/
#mkdir -p DNN/fuz/infrared
#mv *.ali.scr DNN/fuz/infrared
#cd DNN/fuz/infrared
mkdir -p multistream/DBNF/rand/color/two
mv *.ali.scr multistream/DBNF/rand/color/two
cd multistream/DBNF/rand/color/two
mkdir score
find -maxdepth 2 -name '*.sys' | xargs -i cp {} score/
