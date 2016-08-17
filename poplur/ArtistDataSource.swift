//
//  ArtistDataSource.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-16.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit


class ArtistDataSource: NSObject {
    
    //NAME
    let safeName = "safe"
    let royName = "roy woods"
    let danielName = "daniel ceasar"
    let navName = "nav"
    
    //IMAGES
    let safeImg = UIImage(named: "safe")
    let royImg = UIImage(named: "roywoods")
    let danielImg = UIImage(named: "danielCeasarpic.jpg")
    let navImg = UIImage(named: "beatsbynav.jpg")
    
    
    //SOUNDS
    let track1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Eternity", ofType: "mp3")!)
    let track2 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Back2", ofType: "mp3")!)
    let track3 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("WayOut", ofType: "mp3")!)
    let track4 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Feel", ofType: "mp3")!)
    let track5 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Siri", ofType: "mp3")!)
    let track6 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("NuhTime", ofType: "mp3")!)

    let track7 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Jealousy", ofType: "mp3")!)
    
    let track8 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("danielceasarScream", ofType: "mp3")!)
    
    let track9 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("navUp", ofType: "mp3")!)

    
    let safeAlbum: NSArray!
    
    let royAlbum: NSArray!
    
    let ceasarAlbum: NSArray!
    
    let navAlbum: NSArray!
    
    //BIO
    
    let safeBio = "In nine months SAFE has gone from uploading his first track to Soundcloud to selling out Toronto’s Mod Club. It’s an impressive feat for anyone, but especially for an artist who is just 18-years old—three years younger than The Weeknd was when he held his debut performance at the same venue. I’m scheduled to meet with him not far from The Esplanade, the eastern downtown Toronto neighborhood where he was raised. When he finally arrives, he’s clad in an olive bomber jacket and jeans with one of his managers in tow. His long hair is tied back in a bun, and his facial hair casts a faint shadow across his face as he smiles and extends his hand in greeting. Musaad began writing lyrics around the age of 13, despite basketball being his first love. “I used to go hard playing ball,” Musaad explains, “but when I was in the 10th grade my league had a strike and there was no more basketball program.” With his hobby put on ice, Musaad began directing more of his energy towards music. Writing lyrics became habitual and he tried his hand at recording, resulting in his first two songs. "
    
    let royBio = "Denzel Spencer (born April 18, 1996), better known by his stage name Roy Woods (stylized as Roy Wood$), is a Canadian rapper, singer and songwriter from Brampton, Ontario.He attended Turner Fenton Secondary School for three years before switching to St. Augustine Secondary School for his final year of high school. Before his music career took off, he was often recognized for his commitment and talent in football. The origin of his name comes from a youth that linved in the same building as him from Brampton giving Roy his name after his previous one, Woods took a survey throughout his high school and Roy Wood$ seemed to be the winning ticket when he asked his peers. In an October 2014 interview with HotNewHipHop, he said some of his biggest influences are Michael Jackson, Drake, Nelly, The Weeknd and PartyNextDoor. He is signed to OVO Sound, the record label co-founded by rapper Drake, producer Noah 40 Shebib and Oliver El-Khatib."
    
    let ceasarBio = "When you think of the Toronto music scene, the first names that come to mind probably include Drake, PARTYNEXTDOOR, and pretty much the whole OVO movement in general. But there's a lot more the 6 has to offer, like singer-songwriter Daniel Caesar, who is making moves in his own lane. The 21-year-old artist began singing as early as he can remember, and started to take things more seriously when he graduated high school. It was after this that Caesar met some big names in the scene, and began to work on his first EP, Praise Break. His music focuses on themes of love, the millennial generation, and religion—something that played a large role in his upbringing."
    
    let navBio = "Nav has made it clear he is a proud member of the Rexdale community. It’s possible that Nav is from Indian decent seeing as Nav could be short for a few names of Indian origin (and there’s a big Indian community in Rexdale). He’s been releasing music for about a year and each of his 7 songs on SoundCloud are at over 2 million plays. He has about 90,000 followers on SoundCloud and over 30 million plays in total. His beat-making and production skills are insanely good. This year Nav got co-signs from Post Malone, Kylie Jenner, OVO Sound Radio, and The Weeknd’s manager Cash."
    

    override init () {
        
        safeAlbum = [track1, track2, track3, track4, track5, track6]
        
        royAlbum = [track7]
        
        ceasarAlbum = [track8]
        
        navAlbum = [track9]
        
    }
    
    
    
  
    
    
}