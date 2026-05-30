# 🚀 TNYX Super-App Architecture: Modular Shell Framework

## 1. विज़न (Vision)
TNYX को एक "Super-App" बनाना जहाँ Nutrition, Workout, और AI जैसे जटिल फीचर्स एक ही छत के नीचे बिना परफॉरमेंस खोए चल सकें। इसके लिए हम **"Root Shell Pattern"** का उपयोग करेंगे, जो नेविगेशन (Navigation) को फीचर कंटेंट (Content) से पूरी तरह अलग कर देगा।

## 2. आर्किटेक्चरल शिफ्ट (Architectural Shift)

| विशेषता | वर्तमान स्थिति (Home-Centric) | प्रस्तावित स्थिति (Modular Shell) |
| :--- | :--- | :--- |
| **Main Component** | `HomeScreen.dart` (सब कुछ संभालता है) | `MainNavigationShell.dart` (सिर्फ फ्रेमवर्क) |
| **Logic** | `HomeViewModel` (बहुत भारी / Bloated) | `ShellViewModel` (सिर्फ टैब और ग्लोबल स्टेट) |
| **Features** | `tabs/home_tab.dart` (एक विजेट मात्र) | `features/home/HomeScreen.dart` (स्वतंत्र फीचर) |
| **Performance** | टैब बदलने पर Home का लोड बना रहता है | हर टैब का अपना मेमोरी मैनेजमेंट और VM होगा |

---

## 3. नया फोल्डर स्ट्रक्चर (Modular Directory Map)

```text
lib/src/
 ├── core/                      # ग्लोबल थीम, यूटिलिटीज, और कॉमन कंपोनेंट्स
 └── features/
      ├── main_navigation/      # [NEW] ऐप का "Control Center"
      │    ├── presentation/
      │    │    ├── main_shell.dart         # TopBar + BottomNav + Persistent View
      │    │    └── shell_view_model.dart   # टैब स्विचिंग और ग्लोबल UI स्टेट्स
      │    └── navigation/
      │         └── shell_routes.dart       # इंटरनल टैब नेविगेशन लॉजिक
      │
      ├── home/                 # स्वतंत्र Home फीचर
      │    └── presentation/
      │         ├── home_screen.dart        # अब यह सिर्फ होम कंटेंट है
      │         └── home_view_model.dart    # केवल होम का डेटा और लॉजिक
      │
      ├── nutrition/            # स्वतंत्र Nutrition फीचर
      │    └── presentation/
      │         ├── nutrition_screen.dart
      │         └── nutrition_view_model.dart
      │
      ├── workout/              # स्वतंत्र Workout फीचर
      │    └── presentation/
      │         ├── workout_screen.dart
      │         └── workout_view_model.dart
      └── ...
```

---

## 4. तकनीकी स्तंभ (Technical Pillars for Super-App)

### 4.1. Persistent Global Shell
`MainNavigationShell` ऐप की वह बाहरी "खाल" होगी जो कभी भी नष्ट (Dispose) नहीं होगी। 
- **Top Bar & Bottom Nav**: ये यहाँ फिक्स रहेंगे।
- **IndexedStack / PageView**: कंटेंट को स्मूथली स्विच करने के लिए उपयोग किया जाएगा।

### 4.2. Decoupled Logic (स्वतंत्र लॉजिक)
- जब यूजर **Workout** टैब पर होगा, तो `NutritionViewModel` मेमोरी से हट सकता है (यदि आवश्यक हो), जिससे ऐप कभी लैग (Lag) नहीं करेगी।
- हर मॉड्यूल की अपनी **Action** और **State** फाइलें होंगी, जिससे टीम के अलग-अलग डेवलपर्स एक साथ बिना टकराव के काम कर सकेंगे।

### 4.3. Unified Design Tokens
`core/theme/tokens/` का उपयोग जारी रहेगा। शेल (Shell) और सभी फीचर्स एक ही डिजाइन सिस्टम साझा करेंगे, जिससे यूजर को एक "Seamless" अनुभव मिलेगा।

---

## 5. लाभ (The Super-App Benefits)

1. **Scalability**: आप 100 नए टैब्स या फीचर्स जोड़ सकते हैं, ऐप का स्ट्रक्चर नहीं बिगड़ेगा।
2. **Maintenance**: अगर 'Nutrition' में कोई बग (Bug) आता है, तो उसे ठीक करने के लिए 'Home' के कोड को छूने की जरूरत नहीं पड़ेगी।
3. **Speed**: "Cold Start" से लेकर "Tab Switching" तक सब कुछ "Micro-seconds" में होगा।
4. **Clean Code**: यह "Solid Principles" का 100% पालन करता है।

---

## 6. क्रियान्वयन के चरण (Implementation Roadmap)

1. **Phase 1: The Extraction**
   - `HomeScreen` से `Scaffold` और `BottomNav` को निकालकर `features/main_navigation/` में ले जाना।
2. **Phase 2: Feature Birth**
   - वर्तमान `tabs/` फोल्डर की फाइलों को उनके अपने फीचर फोल्डर्स में `Screen` के रूप में प्रमोट करना।
3. **Phase 3: VM Independence**
   - हर नई स्क्रीन के लिए अलग `ViewModel` असाइन करना।

---

**CTO Verdict:**
यह आर्किटेक्चर TNYX को **Industry-Standard** बना देगा। यह वही तरीका है जिसे **Grab, Gojek, और Uber** जैसी "Super-Apps" इस्तेमाल करती हैं।
