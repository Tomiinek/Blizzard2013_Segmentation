# Transcripts & Alignments for the (Lessac) Blizzard Challenge 2013 audiobooks 

Recent work in **Text-To-Speech focuses** on generating an **expressive** and interesting **speech**. However, results of all the proposed models depends on high quality audio data with transcripts. **A lot of works links to audiobooks from the Blizzard Challange 2013**:

- [Towards End-to-End Prosody Transfer for Expressive Speech Synthesis with Tacotron](https://arxiv.org/abs/1803.09047)
- [Style Tokens: Unsupervised Style Modeling, Control and Transfer in End-to-End Speech Synthesis](https://arxiv.org/abs/1803.09017)
- [Predicting Expressive Speaking Style From Text In End-To-End Speech Synthesis](https://arxiv.org/abs/1808.01410)
- [Hierarchical Generative Modeling for Controllable Speech Synthesis](https://arxiv.org/abs/1810.07217)
- [Location-Relative Attention Mechanisms For Robust Long-Form Speech Synthesis](https://arxiv.org/abs/1910.10288)

The [Blizzard Challange 2013](https://www.synsig.org/index.php/Blizzard_Challenge_2013) brought to us a data-set of high quality audiobooks which were generously provided by *The Voice Factory* and *Lessac Technologies*. The data-set **contains unsegmented single-speaker** audiobooks with a total duration of almost two hundreds hours read in a **highly expressive** maner by **Catherine Byers**  

Hopefuly, this repository do not harm the [License for Blizzard 2013 Materials](http://www.cstr.ed.ac.uk/projects/blizzard/2013/lessac_blizzard2013/license.html) as it does not contain any data provided by the Blizzard Challange.

Transcripts of the audiobooks can be found [here](http://www.gutenberg.org/). We used these transcripts despite the fact that the audios and transcripts do not match exactly.


## What is in this repository?

**This repository contains:**
- **Normalized transcripts splitted on the sentence level** in a way which I hope is suitable for the Text-To-Speech task. 
- **Meta-data for segmentation** of the original unsegmented **audiobooks** provided by Blizzard 2013 Challange.

**The following audiobooks were processed**: Emma, Mansfield Park, Persuasion, Pride and Prejudice, Sense and Sensibility, The Emerald City of Oz, The Patchwork Girl of Oz, A Little Princess, The Secret Garden, Through the Looking Glass, The Awakening, Silas Marner, A Room with a View, Far from the Madding Crowd, The Scarlet Letter, The Gift of the Magi, Daisy Miller, Washington Square, The Jungle Book, Carmilla, Black Beauty, Treasure Island, Ethan Frome, Madame de Treymes, Summer. 

**Total duration** of these audibooks should be **149.4 hours**.

## Getting the data

1. Visit [this website](http://www.cstr.ed.ac.uk/projects/blizzard/2013/lessac_blizzard2013/license.html) to **get a research license agreement**. You will be granted in few days.
2. **Download** the original **audiobooks** from [there](https://www.synsig.org/index.php/Blizzard_Challenge_2013). You should have a file with this name: 

   ```
   Lessac_Blizzard2013_CatherineByers_train.tar.bz2
   ```
3. **Clone** this repository: 
   
   ```
   git clone https://github.com/Tomiinek/Blizzard2013_Segmentation.git target/directory/ && cd target/directory/
   ```
4. **Extract** the **downloaded audiobooks** into the repository directory: 

   ```
   tar xjfv ~Downloads/Lessac_Blizzard2013_CatherineByers_train.tar.bz2
   ```
5. **Remove redundant audiobooks** and acomodate folder structure, **convert `.mp3` to `.wav`**: 

   ```
   ./extract.sh .
   ```
6. **Run segmentation** (this will take a long time): 

   ```
   ./segmentation.sh .
   ```
7. Now, you should see folders `transcripts` and `segments` with all the transcripts and segmented recordings. The file `all.txt` **contains a subset of utterances (spanning 122.8 hours)** which you can find in the `transcripts` directory (without items with weird ratio between segment duration and utterance length) together **with their phonemized variants** (IPA) and **links to corresponding audio files**. A sample row:

   ```
   000011|segments/a_little_princess/01-000012.wav|What is it, darling?|wɒt ɪz ɪt, dɑːlɪŋ?
   ```


## Distribution of the data

Uterrance length distrubition:
![Length distribution](/_img/length_dist.png)

Utterance length vs segment duration:
![Length vs Duration](/_img/length_vs_duration.png)

## Pitfalls

The Aeneas forced aligner sometimes does not provide a correct alignment. Thus there might be some short utterances (like "Yes?") included also in the audio segment of the following utterance. So please consider removing these very short utterances together with their immediate succesors.

## Acknowledgements

Alignments were obtained using **Aeneas aligner** and **ffmpeg**; phonemized variants were acquired using **Phonemizer**.
