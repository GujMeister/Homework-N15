import Foundation

struct Zodiac {
    let imageName: String
    let name: String
    let description: String
    let oppositeSign: String
    let oppositeSignName: String
}

let zodiacs: [Zodiac] = [
    Zodiac(imageName: "Aries", name: "ვერძი", description: "Courageous, energetic, and adventurous. Aries are dynamic and competitive individuals who are always ready to take on new challenges and explore new horizons.", oppositeSign: "Libra", oppositeSignName: "სასწორი"),
    Zodiac(imageName: "Taurus", name: "კურო", description: "Patient, reliable, and stable. Taurus are known for their strong determination and unwavering perseverance in the face of adversity.", oppositeSign: "Scorpio", oppositeSignName: "მორიელი"),
    Zodiac(imageName: "Gemini", name: "ტყუპები", description: "Adaptable, curious, and outgoing. Gemini are known for their dual nature, embracing both logic and creativity in their approach to life.", oppositeSign: "Sagittarius", oppositeSignName: "მშვილდოსანი"),
    Zodiac(imageName: "Cancer", name: "კირჩხიბი", description: "Intuitive, emotional, and compassionate. Cancer are deeply caring and protective individuals, guided by their strong intuition and empathy.", oppositeSign: "Capricorn", oppositeSignName: "თხის რქა"),
    Zodiac(imageName: "Leo", name: "ლომი", description: "Generous, loyal, and confident. Leo are natural leaders with a warm heart, inspiring others with their charisma and passion for life.", oppositeSign: "Aquarius", oppositeSignName: "მერწყული"),
    Zodiac(imageName: "Virgo", name: "ქალწული", description: "Practical, analytical, and hardworking. Virgo are detail-oriented and diligent individuals, striving for perfection in everything they do.", oppositeSign: "Pisces", oppositeSignName: "თევზები"),
    Zodiac(imageName: "Libra", name: "სასწორი", description: "Charming, diplomatic, and fair-minded. Libra seek balance and harmony in all aspects of life, valuing peace and cooperation.", oppositeSign: "Aries", oppositeSignName: "ვერძი"),
    Zodiac(imageName: "Scorpio", name: "მორიელი", description: "Passionate, resourceful, and brave. Scorpio are fiercely loyal and determined individuals, unafraid to delve deep into the mysteries of life.", oppositeSign: "Taurus", oppositeSignName: "კურო"),
    Zodiac(imageName: "Sagittarius", name: "მშვილდოსანი", description: "Optimistic, independent, and adventurous. Sagittarius love freedom and exploration, embracing life's challenges with enthusiasm and optimism.", oppositeSign: "Gemini", oppositeSignName: "ტყუპები"),
    Zodiac(imageName: "Capricorn", name: "თხის რქა", description: "Responsible, disciplined, and self-controlled. Capricorn are ambitious and practical individuals, working diligently to achieve their long-term goals.", oppositeSign: "Cancer", oppositeSignName: "კირჩხიბი"),
    Zodiac(imageName: "Aquarius", name: "მერწყული", description: "Progressive, original, and humanitarian. Aquarius are visionaries with an independent spirit, striving to create positive change in the world.", oppositeSign: "Leo", oppositeSignName: "ლომი"),
    Zodiac(imageName: "Pisces", name: "თევზები", description: "Compassionate, artistic, and gentle. Pisces are intuitive and deeply empathetic individuals, guided by their imagination and emotional depth.", oppositeSign: "Virgo", oppositeSignName: "ქალწული")
]

