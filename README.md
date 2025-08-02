# OptimalWeave
Introduction
OptimalWeave is a ESO (Elder Scrolls Online) addon designed to optimize your combat rhythm by intelligently managing ability queuing during the Global Cooldown (GCD). Unlike traditional weaving helpers, it offers granular control over your rotation, adapts to latency, and includes class-specific optimizations for skills like Grim Focus and Fatecarver.


Features
- Smart Mode Selection
- Hard Mode: Strict GCD blocking (no queuing).
- Soft Mode: Queues skills only if no Light Attack is pending.
- Auto-disables in Tank/Healer roles when configured.
- Class-Specific Enhancements:
  * Grim Focus: Block morphs until stacks reach user-defined thresholds (5-10).
  * Fatecarver: Require 1-3 Crux stacks before casting.
- Upcoming: Support for Mages/Fighters Guild abilities.
- Technical Precision:
  * Dynamic latency compensation.
  * Channel buffers: 50ms (instant) / 200ms (channeled).
  * GCD detection threshold.
- Safety Protocols:
  * Blocks accidental ground-AOE double-casting.
  * Resets state on stun.
  * Combat/target checks to reduce false positives.

Installation:
1. Download the latest .zip from Releases.

2. Extract to:
text
.../Elder Scrolls Online/live/AddOns/OptimalWeave  
3. Enable in-game via AddOn Manager.

