# 🎴 Kingdoms & Cards Classic ⛓️

[![Godot Engine](https://img.shields.io/badge/Godot-3.6-blue.svg)](https://godotengine.org/download/3.x/)
[![Hedera Hashgraph](https://img.shields.io/badge/Hedera-Testnet-00d4aa.svg)](https://hedera.com/)
[![License](https://img.shields.io/badge/license-Source--Available-orange.svg)](LICENSE.md)
[![Play on itch.io](https://img.shields.io/badge/Play-itch.io-fa5c5c.svg)](https://danodin.itch.io/kingdoms-cards-classic)
[![Hedera Certified](https://img.shields.io/badge/Hedera-Certified%20Developer-00d4aa.svg)](https://certs.hashgraphdev.com/9df500a8-01ff-4130-9924-26a156d815fb.pdf)

> A strategic card battler where Rock-Paper-Scissors meets dice-driven combat, enhanced by blockchain transparency.

**Built for Hedera Hackathon Africa 2025** | **Developed by 2404STUDIOS's Dan Odin**

---

## 🎮 What is KNC?

**Kingdoms & Cards Classic** combines the accessibility of Rock-Paper-Scissors with strategic depth and dice-based randomness. Players duel using three card types in tactical battles where every decision matters and fate can turn the tide.

### Core Features

- ⚔️ **Strategic Card Combat** - King, Soldier, Citizen with rock-paper-scissors dynamics
- 🎲 **Dice-Enhanced Gameplay** - Roll 2d6 or 3d6 to add unpredictability
- 🔥 **Frenzy Mode** - Gain extra dice when down to 3 cards
- ⛓️ **Hedera Integration** - Account authentication via Hedera Testnet
- 🎨 **Polished UI** - Clean, intuitive interface with satisfying animations
- 🔊 **Immersive Audio** - Dynamic music and sound effects

---

## 🏗️ Project Structure
```
kingdoms-and-cards/
├── assets/
│   ├── audio/              # Music and sound effects
│   │   ├── music/          # Background tracks
│   │   └── sound_fx/       # Game sound effects
│   ├── fonts/              # Poppins font family
│   ├── graphics/           # All visual assets
│   │   ├── arena/          # Board and gameplay elements
│   │   ├── cards/          # Card face designs
│   │   ├── dice/           # Dice animations
│   │   ├── splash/         # Splash screen assets
│   │   └── ui/             # UI components and buttons
│   └── themes/             # Godot theme resources
├── autoload/
│   └── auth_manager.gd     # Hedera authentication system Using Hedera Mirror Node integration
├── scenes/
│   ├── arena.gd            # Main gameplay scene
│   ├── board.tscn          # Game board
│   ├── login.tscn          # Hedera login screen
│   ├── player.tscn         # Player deck management
│   ├── cpu.tscn            # AI opponent
│   ├── Profile.tscn        # Player profile UI
│   └── splash.tscn         # Startup splash screen
└── scripts/
    ├── login.gd            # Login screen for auth_manager.gd 
    ├── player.gd           # Player logic
    ├── cpu.gd              # AI opponent logic
    ├── shuffler.gd         # Deck randomization
    └── Profile.gd          # Profile management
```

---

## 🎯 How to Play

### Game Rules

1. **Deck Composition**: 10 cards total
   - 1 King
   - 6 Soldiers
   - 3 Citizens

2. **Card Dynamics**
   - King beats Soldier
   - Soldier beats Citizen
   - Citizen beats King

3. **Combat Resolution**
   - Place card face-down
   - Reveal simultaneously
   - Roll dice (King/Citizen: 2d6, Soldier: 3d6)
   - Higher total wins (Card Strength + Dice Roll)

4. **Frenzy Mode**
   - Triggers at 3 cards remaining
   - Gain +1 die (King/Citizen: 3d6, Soldier: 4d6)

5. **Victory Condition**
   - Eliminate all opponent cards

---

## ⛓️ Hedera Integration

### Authentication System

KNC Classic integrates with the **Hedera Testnet** for player authentication:

- **Mirror Node API**: Verifies account existence via `testnet.mirrornode.hedera.com`
- **Account Validation**: Players authenticate with Hedera Testnet Account IDs
- **Session Management**: Secure login/logout functionality

### Implementation Details
```gdscript
# autoload/auth_manager.gd
func verify_and_connect(account_id: String):
	if account_id.empty():
		emit_signal("connection_failed", "Account ID cannot be empty")
		return
	
	if not _is_valid_account_format(account_id):
		emit_signal("connection_failed", "Invalid format. Use: 0.0.12345")
		return
	
	emit_signal("verification_started")
	print("Verifying account: ", account_id)
	
	var http = HTTPRequest.new()
	add_child(http)
	http.connect("request_completed", self, "_on_verification_complete", [account_id, http])
	
	var url = MIRROR_NODE_URL + account_id
	var error = http.request(url)
	
	if error != OK:
		emit_signal("connection_failed", "Network error")
		http.queue_free()

func _on_verification_complete(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray, account_id: String, http: HTTPRequest):
	http.queue_free()
	
	if response_code == 200:
		var json = JSON.parse(body.get_string_from_utf8())
		
		if json.error == OK:
			var account_data = json.result
			var balance_tinybars = int(account_data.get("balance", {}).get("balance", 0))
			var balance_hbar = balance_tinybars / 100000000.0  # Convert tinybars to HBAR
			
			print("✅ Account verified!")
			print("   Balance: ", balance_hbar, " HBAR")
			
			current_user = {
				"account_id": account_id,
				"display_name": "King " + account_id.split(".")[2],
				"is_connected": true,
				"balance": balance_hbar
			}
			
			emit_signal("wallet_connected", account_id)
			_save_session()
			
		else:
			emit_signal("connection_failed", "Failed to parse account data")
	
	elif response_code == 404:
		emit_signal("connection_failed", "Account not found on Hedera testnet")
	
	else:
		emit_signal("connection_failed", "Verification failed (Error: " + str(response_code) + ")")

func _is_valid_account_format(account_id: String) -> bool:

	var parts = account_id.split(".")
	if parts.size() != 3:
		return false
	
	for part in parts:
		if not part.is_valid_integer():
			return false
	
	return true

```
*NOTE: You may notice that i was setting up code for wallet auth, ran into some issues before deadline*

### Future Roadmap

- 🔄 **Phase 2**: Dice roll verification on Hedera Consensus Service (HCS)
- 🎨 **Phase 3**: Kingdom NFTs via Hedera Token Service (HTS)
- 🏆 **Phase 4**: Tournament results and leaderboards on-chain

---

## 🚀 Installation & Setup

### Prerequisites

- [Godot Engine 3.6+](https://godotengine.org/download)
- Hedera Testnet Account ID (get from [Hedera Portal](https://portal.hedera.com/))

### Running Locally

1. **Clone the repository**
```bash
   git clone https://github.com/YOUR_USERNAME/kingdoms-and-cards.git
   cd kingdoms-and-cards
```

2. **Open in Godot**
```bash
   godot project.godot
```

3. **Run the game**
   - Press F5 or click "Play" in Godot editor

4. **Authenticate**
   - Enter your Hedera Testnet Account ID (e.g., `0.0.123456`)
   - Click "Connect" to verify and play

---

## 🎨 Asset Credits

### Audio
- **Music**: "Sarabande" by Handel, "Casino Music" by Kyrylo Zaplotynskyi
- **Sound Effects**: Custom-designed card game sounds

### Fonts
- **Poppins**: Google Fonts (SIL Open Font License)

### Graphics
- **Original Art**: Designed by Dan Odin

---

## 🛠️ Technical Stack

- **Game Engine**: Godot 3.6
- **Language**: GDScript
- **Blockchain**: Hedera Hashgraph (Testnet)
- **API Integration**: Hedera Mirror Node REST API
- **Export Targets**: Web (HTML5), Windows, Linux

---

## 📋 Development Status

### ✅ Completed (Alpha v1)
- [x] Core gameplay mechanics
- [x] AI opponent system
- [x] Hedera testnet authentication
- [x] Complete UI/UX design
- [x] Audio integration
- [x] Tutorial/Help system
- [x] Profile management

### 🔄 In Progress
- [ ] Hedera Consensus Service integration for dice verification
- [ ] King of Kings mode (elite units, Royal Calls)
- [ ] Multiplayer ranked matches

### 🎯 Planned Features
- [ ] Kingdom NFTs on Hedera Token Service
- [ ] Mode Creator (player-designed game modes)
- [ ] Physical card fulfillment system
- [ ] Hall of Kings leaderboard

---

## 🎮 Play Now

**Live Demo**: [Play on itch.io](https://danodin.itch.io/kingdoms-cards-classic)

**Test Authentication**: Use any valid Hedera Testnet account ID
- Example: `0.0.123456`
- Get your own at [Hedera Portal](https://portal.hedera.com/)

---


## 📊 Project Resources

### Hackathon Submission Materials

- 🎯 **[Pitch Deck](https://docs.google.com/presentation/d/e/2PACX-1vQqhjdNDXoehXmFVP6PUOG4QiLRfISHI0dFjcUuEodoYa-D1fG1e-5EUmQ42PStcpJNZepyyYnetZ2z/pub?start=false&loop=false&delayms=3000)** - Full project presentation
- 🏆 **[Hedera Certification](https://certs.hashgraphdev.com/9df500a8-01ff-4130-9924-26a156d815fb.pdf)** - Developer certification

---

## 📝 License

**Source-Available License - Educational Use Only**

Copyright (c) 2024 Dan Odin / 2404STUDIOS

Permission is hereby granted to view, study, and learn from this source code 
for educational purposes only.

**Restrictions:**
- ❌ **No redistribution** - You may not distribute this software
- ❌ **No commercial use** - You may not use this software for profit
- ❌ **No modifications** - You may not create derivative works
- ❌ **No sublicensing** - You may not grant others any rights to this code

**Allowed:**
- ✅ Viewing the source code
- ✅ Learning from the implementation
- ✅ Referencing in educational contexts (with attribution)

This project was created for the Hedera Hackathon Africa 2025 and is provided 
for transparency and educational purposes only.

For commercial licensing inquiries, contact: 2404studios@gmail.com

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

---

## 👥 Team

**2404STUDIOS**
- **Developer**: Dan Odin
- **Contact**: [Twitter](https://x.com/danodin69) | [Telegram](https://t.me/danodin | [Twitter](https://x.com/2404STUDIO)
- **Support**:  Dahunsi, Favour, Dammy

---

## 🙏 Acknowledgments

- Built for the **Hedera Hackathon Africa 2025**
- Special thanks to the Hedera developer community (JTconnect Ibadan)
- Inspired by classic card games and roguelike progression systems

---


**Made with ❤️ and blockchain transparency**

*Long Live Kingdoms & Cards* 👑
