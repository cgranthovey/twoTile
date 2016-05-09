//
//  storeWord.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/11/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import Foundation

class StoreWord {
    private var _aa = ScrabbleWord(word: "Aa", partOfSpeech: "noun", definition: "A dry form of Lava", image: "https://upload.wikimedia.org/wikipedia/commons/f/f1/Aa_large.jpg")
    private var _ab = ScrabbleWord(word: "Ab", partOfSpeech: "noun", definition: "Muscles in the stomach", image: "https://s-media-cache-ak0.pinimg.com/236x/a4/18/45/a418454e46ee5e0bf308e8378ce9e3ba.jpg")
    private var _ad = ScrabbleWord(word: "Ad", partOfSpeech: "noun", definition: "Short for advertisement", image: "http://s.wsj.net/public/resources/images/OB-RM283_paull3_DV_20120122234629.jpg")
    private var _ae = ScrabbleWord(word: "Ae", partOfSpeech: "adjective", definition: "One", image: "http://images.clipartpanda.com/one-clipart-number-one-gray-md.png")
    private var _ag = ScrabbleWord(word: "Ag", partOfSpeech: "adjective", definition: "relating to agriculture", image: "http://howafrica.com/wp-content/uploads/2015/06/Agriculture-chemical.jpg")
    private var _ah = ScrabbleWord(word: "Ah", partOfSpeech: "interjection", definition: "an exclamation used to express realization or happiness", image: "http://previews.123rf.com/images/unkreatives/unkreatives1208/unkreatives120800003/14850837-illustration-of-a-comic-style-light-bulb-Stock-Vector-lightbulb.jpg")
    private var _ai = ScrabbleWord(word: "Ai", partOfSpeech: "noun", definition: "Three clawed sloth", image: "https://upload.wikimedia.org/wikipedia/commons/1/18/Bradypus.jpg")
    private var _al = ScrabbleWord(word: "Al", partOfSpeech: "noun", definition: "Indian shrub", image: "http://whangareiflora.weebly.com/uploads/8/4/3/9/8439522/3531261_orig.jpg")
    private var _am = ScrabbleWord(word: "Am", partOfSpeech: "verb", definition: "To exist", image: "https://upload.wikimedia.org/wikipedia/commons/7/73/Frans_Hals_-_Portret_van_Ren%C3%A9_Descartes.jpg")
    private var _an = ScrabbleWord(word: "An", partOfSpeech: "indefinite article", definition: "indefinite article placed before words making a vowel sound", image: "http://phandroid.s3.amazonaws.com/wp-content/uploads/2015/02/galaxy-wallpaper-11.jpg")
//    private var _ar = ScrabbleWord(word: "Ar", partOfSpeech: "noun", definition: "The letter R", image: "https://upload.wikimedia.org/wikipedia/commons/b/be/Bonney%2C_Anne_%281697-1720%29.jpg")
//    private var _as = ScrabbleWord(word: "As", partOfSpeech: "noun", definition: "Norse God", image: "https://s-media-cache-ak0.pinimg.com/736x/e5/b2/ec/e5b2ec9c6d28db57d0a6ef7efc38129f.jpg")
//    private var _at = ScrabbleWord (word: "At", partOfSpeech: "preposition", definition: "denoting time", image: "http://www.freeimageslive.com/galleries/objects/watch/pics/pocketwatch0837.jpg")
//    private var _aw = ScrabbleWord(word: "Aw", partOfSpeech: "exclamation", definition: "Way of expressing sympathy or protest", image: "http://s8.favim.com/orig/150828/black-and-white-boy-cozy-cute-Favim.com-3199559.jpg")
//    private var _ax = ScrabbleWord(word: "Ax", partOfSpeech: "verb", definition: "Tool used to chop wood", image: "http://ecx.images-amazon.com/images/I/71rXaCg%2BpUL._SL1500_.jpg")
//    private var _ay = ScrabbleWord(word: "Ay", partOfSpeech: "noun", definition: "Said to express affirmation", image: "http://ichef.bbci.co.uk/live-experience/cps/1024/mcs/media/images/81110000/jpg/_81110265_strasbourgvotingphoto.jpg")
//    private var _ba = ScrabbleWord(word: "Ba", partOfSpeech: "noun", definition: "According to ancient egypt this was one of five parts of the soul", image: "http://www.radostnezpravy.cz/wp-content/uploads/2014/08/BD_Mummy_and_Ba-zdroj-wikimedia-commons.jpg")
//    private var _be = ScrabbleWord(word: "Be", partOfSpeech: "exist", definition: "to exist", image: "https://happytrudgers.files.wordpress.com/2011/07/creation-of-adam-02.jpg")
//    private var _bi = ScrabbleWord(word: "Bi", partOfSpeech: "noun", definition: "Bisexual", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Bisexual-moon-symbol.svg/872px-Bisexual-moon-symbol.svg.png")
//    private var _bo = ScrabbleWord(word: "Bo", partOfSpeech: "noun", definition: "pal", image: "http://static3.businessinsider.com/image/51b5fc246bb3f7f33a000017/19-unlikely-animals-who-are-best-friends.jpg")
//    private var _by = ScrabbleWord(word: "By", partOfSpeech: "adverb", definition: "to pass by", image: "http://i2.wp.com/web2.fakulteti.mk/Images/News/2011/10/20111310-Comet-Elenin-coming-pass-earth-2011.jpg?resize=550%2C396")
//    private var _de = ScrabbleWord(word: "De", partOfSpeech: "preposition", definition: "from", image: "http://img.livraddict.com/covers/107/107955/couv67382744.jpg")
//    private var _do = ScrabbleWord(word: "Do", partOfSpeech: "verb", definition: "To perform an action", image: "https://i.ytimg.com/vi/ZXsQAXx_ao0/maxresdefault.jpg")
//    private var _ed = ScrabbleWord(word: "Ed", partOfSpeech: "noun", definition: "Education", image: "https://jordangordon.files.wordpress.com/2010/09/pembroke-library-1.jpg")
//    private var _ef = ScrabbleWord(word: "Ef", partOfSpeech: "noun", definition: "letter f", image: "http://etc.usf.edu/presentations/extras/letters/varsity_letters/51/18/f-400.png")
//    private var _eh = ScrabbleWord(word: "Eh", partOfSpeech: "exclamation", definition: "used when a listener doesn't understand something", image: "http://www.metronews.ca/content/dam/thestar/2014/05/30/canada-eh-618x408.jpg")
//    private var _el = ScrabbleWord(word: "El", partOfSpeech: "noun", definition: "letter l", image: "http://etc.usf.edu/presentations/extras/letters/varsity_letters/16/24/l-400.png")
//    private var _em = ScrabbleWord(word: "Em", partOfSpeech: "noun", definition: "a unit used by printers to measure width", image: "http://publiclibrariesonline.org/wp-content/uploads/2013/12/printingpress2.jpg")
//    private var _en = ScrabbleWord(word: "En", partOfSpeech: "noun", definition: "half an em", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Hoe's_one_cylinder_printing_press.png/1280px-Hoe's_one_cylinder_printing_press.png")
//    private var _er = ScrabbleWord(word: "Er", partOfSpeech: "exclamation", definition: "Sound used when expressing hesitation", image: "https://media.licdn.com/mpr/mpr/p/8/005/08d/3b4/1f91364.jpg")
//    private var _es = ScrabbleWord(word: "Es", partOfSpeech: "noun", definition: "The letter s", image: "http://etc.usf.edu/presentations/extras/letters/varsity_letters/39/31/s-400.png")
//    private var _et = ScrabbleWord(word: "Et", partOfSpeech: "verb", definition: "Past tense of eat", image: "http://a.abcnews.go.com/images/GMA/151018_dvo_pop_cupcake_33x16_1600.jpg")
//    private var _ex = ScrabbleWord(word: "Ex", partOfSpeech: "noun", definition: "The letter x", image: "http://etc.usf.edu/presentations/extras/letters/fridge_magnets/orange/34/x-400.png")
//    private var _fa = ScrabbleWord(word: "Fa", partOfSpeech: "noun", definition: "musical note", image: "http://mickji.altervista.org/wp-content/uploads/2013/09/syllab.png")
//    private var _fe = ScrabbleWord(word: "Fe", partOfSpeech: "noun", definition: "hebrew letter", image: "http://jewishstudies.washington.edu/wp-content/uploads/2014/07/biblical_hebrew_modern_hebrew.jpg")
//    private var _fy = ScrabbleWord(word: "Fy", partOfSpeech: "expression", definition: "an interjection which represents disgust", image: "http://img.lum.dolimg.com/v1/images/au_character_insideout_bio_disgust_b2c9b79d.jpeg?region=0,0,600,600&width=320")
//    private var _gi = ScrabbleWord(word: "Gi", partOfSpeech: "noun", definition: "clothing worn while practicing Judo", image: "http://judogi.co.uk/1612-thickbox_default/adidas-club-judo-gi.jpg")
//    private var _go = ScrabbleWord(word: "Go", partOfSpeech: "verb", definition: "To depart", image: "http://1000awesomethings.com/wp-content/uploads/2011/09/driving-your-car.jpg")
//    private var _gu = ScrabbleWord(word: "Gu", partOfSpeech: "noun", definition: "A type of violin from Shetland", image: "http://media.guitarcenter.com/is/image/MMGS7/My-Violin-Starter-Pack-1-2-Size/H73551000005000-00-500x500.jpg")
//    private var _ha = ScrabbleWord(word: "Ha", partOfSpeech: "exclamation", definition: "A sound made when surpised", image: "http://images.inmagine.com/400nwm/iris/cusprm-039/ptg02191077.jpg")
//    private var _he = ScrabbleWord(word: "He", partOfSpeech: "noun", definition: "male", image: "http://images.clipartpanda.com/male-clipart-male-bathroom-bw-w-o-boarder-md.png")
//    private var _hi = ScrabbleWord(word: "Hi", partOfSpeech: "exclamation", definition: "Used as a greeting.", image: "http://wtbuzz.com/wp-content/uploads/2014/08/cute-animals-saying-hi-4__605.jpg")
//    private var _hm = ScrabbleWord(word: "Hm", partOfSpeech: "interjection", definition: "Used when someone is thinking", image: "http://alllies.org/en/wp-content/uploads/2015/02/monkey.jpg")
//    private var _ho = ScrabbleWord(word: "Ho", partOfSpeech: "interjection", definition: "Used to bring attention", image: "http://www.idology.com/wp-content/uploads/2013/12/bigstock-Santa-Claus-show-ok-isolated-o-38669275.jpg")
//    private var _id = ScrabbleWord(word: "Id", partOfSpeech: "noun", definition: "Unconcious part of psyche responsible for impulses which lust after pleasure", image: "http://www.simplypsychology.org/tripartite-personality.jpg")
//    private var _if = ScrabbleWord(word: "If", partOfSpeech: "conjunction", definition: "In the incident that", image: "http://s.marketwatch.com/public/resources/MWimages/MW-BS549_flying_MG_20140114161056.jpg")
//    private var _in = ScrabbleWord(word: "In", partOfSpeech: "Noun", definition: "A connection, often political", image: "https://www.whitehouse.gov/sites/whitehouse.gov/files/images/Administration/People/president_official_portrait_hires.jpg")
//    private var _is = ScrabbleWord(word: "Is", partOfSpeech: "verb", definition: "Third person of be", image: "http://mms.businesswire.com/media/20130501005715/en/367436/4/LIG_logo_Loose_coin_highres.jpg")
//    private var _it = ScrabbleWord(word: "It", partOfSpeech: "noun", definition: "Person touched during a game of tag", image: "http://www.cloudninediscovery.com/ediscoverydaily/wp-content/uploads/blog-images/Tag.png")
//    private var _jo = ScrabbleWord(word: "Jo", partOfSpeech: "noun", definition: "Sweetheart, used in Scotland", image: "http://greenweddingshoes.com/wp-content/uploads/2011/04/scottish-engagement-photos-11.jpg")
//    private var _ka = ScrabbleWord(word: "Ka", partOfSpeech: "noun", definition: "(Ancient Egypt) Part of the spirit which lived on in a mummified body after death", image: "https://s-media-cache-ak0.pinimg.com/736x/8a/50/52/8a505278b426744fcc4a14460bece5f4.jpg")
//    private var _ki = ScrabbleWord(word: "Ki", partOfSpeech: "noun", definition: "A life force in Chinesse medicine which flows throughout the body", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Ki_obsolete.svg/2000px-Ki_obsolete.svg.png")
//    private var _la = ScrabbleWord(word: "La", partOfSpeech: "noun", definition: "Sixth note in diatonic music scale", image: "https://upload.wikimedia.org/wikipedia/commons/9/9e/A440.png")
//    private var _li = ScrabbleWord(word: "Li", partOfSpeech: "noun", definition: "Chinese measurement distance, about .5 km", image: "https://upload.wikimedia.org/wikipedia/commons/4/49/Anping_Bridge_-_west-central_part_-_looking_west_-_DSCF9094.JPG")
//    private var _lo = ScrabbleWord(word: "Lo", partOfSpeech: "interjection", definition: "Said when desiring attention", image: "https://i.ytimg.com/vi/TP8RB7UZHKI/maxresdefault.jpg")
//    private var _ma = ScrabbleWord(word: "Ma", partOfSpeech: "noun", definition: "Mother", image: "http://weknowyourdreamz.com/images/mother/mother-06.jpg")
//    private var _me = ScrabbleWord(word: "Me", partOfSpeech: "pronoun", definition: "Used by a person in reference to themselves", image: "http://slice.seriouseats.com/images/2013/08/20130807-pizza-proposal-will-you-marry-me.jpg")
//    private var _mi = ScrabbleWord(word: "Mi", partOfSpeech: "noun", definition: "Third note in diatonic music scale", image: "http://openmusictheory.com/Graphics/sdsf-naturalMinor.png")
//    private var _mm = ScrabbleWord(word: "Mm", partOfSpeech: "interjection", definition: "Used to convey one's approval", image: "http://government.northcrane.com/wp-content/uploads/2016/02/great_wall_trump.jpg")
//    private var _mo = ScrabbleWord(word: "Mo", partOfSpeech: "noun", definition: "Short amount of time", image: "https://s-media-cache-ak0.pinimg.com/236x/c1/d8/c8/c1d8c8b905da73763356d707a90f6588.jpg")
//    private var _mu = ScrabbleWord(word: "Mu", partOfSpeech: "noun", definition: "12th letter of the Greek Alphabet", image: "https://upload.wikimedia.org/wikipedia/commons/0/0e/Greek_lc_mu.png")
//    private var _my = ScrabbleWord(word: "My", partOfSpeech: "pronoun", definition: "possesive I", image: "http://www.empirecinemas.co.uk/_uploads/film_images/6668_4947.jpg")
//    private var _na = ScrabbleWord(word: "Na", partOfSpeech: "determiner", definition: "no", image: "http://www.clipartbest.com/cliparts/MiL/kAz/MiLkAzLgT.png")
    
    func getWord() -> [ScrabbleWord]{
        return [_aa, _ab, _ad, _ae, _ag, _ah, _ai, _al, _am, _an]
        //, _ar, _as, _at, _aw, _ax, _ay, _ba, _be, _bi, _bo, _by, _de, _do, _ed, _ef, _eh, _el, _em, _en, _er, _es, _et, _ex, _fa, _fe, _fy, _gi, _go, _gu, _ha, _he, _hi, _hm, _ho, _id, _if, _in, _is, _it, _jo, _ka, _ki, _la, _li, _lo, _ma, _me, _mi, _mm, _mo, _mu, _my, _na
    }
}