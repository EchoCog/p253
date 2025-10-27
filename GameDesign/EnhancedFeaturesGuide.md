# Enhanced Template Features - Quick Reference

This guide highlights the key differences and new features in the Enhanced Edition template compared to the First Edition.

## New Fields Summary

| Feature | Purpose | Usage Guidelines |
|---------|---------|------------------|
| **Descriptive Title** | Clarify abstract pattern names | Keep practical and specific; explains what the memorable name means |
| **Audience** | Define target player demographics | Can specify multiple audiences; be as specific or broad as needed |
| **Additional Pattern Problems** | Support multi-problem patterns | Use sparingly; prefer breaking complex patterns into simpler ones |
| **Context** | When to apply the pattern | Describe situations, game types, development contexts |
| **Consequences** | Effects beyond the main solution | Include positive, negative, and situational effects |
| **Constraints** | Limitations and requirements | Internal (game design) and external (development environment) |
| **Secondary Examples** | Related implementations | Games similar to main examples, grouped by similarity |

## Enhanced Sections

### Audience Definition Examples

**Broad Audience:**
- Age Range: 8+ years old
- Gaming Experience: Casual to experienced
- Demographics: Players new to the genre

**Specific Audience:**
- Age Range: 16-25 years old  
- Gaming Experience: Competitive multiplayer veterans
- Demographics: Brazilian players familiar with football culture

### Context and Consequences Structure

**Context Example:**
"Most effective in real-time strategy games where players must manage multiple simultaneous systems. Works particularly well when economic and military mechanics are interdependent."

**Consequences Examples:**

*Positive:*
- Increased strategic depth
- Better player engagement retention
- Natural learning progression

*Negative:*
- Potential analysis paralysis for new players
- Increased UI complexity requirements
- Higher cognitive load

*Situational:*
- Effects vary based on player's cultural background with strategy games
- More effective in mouse/keyboard interfaces than touch screens

### Constraints Categories

**Internal Constraints:**
- Requires real-time systems
- Only effective with persistent progression
- Needs multiplayer infrastructure

**External Constraints:**
- Budget: Requires additional UI development time
- Studio Size: Need dedicated systems designer  
- Engine: Requires robust networking capability
- Timeline: Pattern implementation needs 2-3 months minimum

## Multiple Problems Guidance

### When to Use Additional Problems
✅ **Good use case:** Pattern naturally solves multiple related problems
✅ **Good use case:** Side effects become design problems in their own right
✅ **Good use case:** Pattern addresses different problems for different audiences

❌ **Avoid:** Forcing multiple problems into one pattern for completeness
❌ **Avoid:** Problems that are actually separate patterns combined
❌ **Avoid:** Problems that contradict each other or require different solutions

### Example Numbering
When using multiple problems, number them and reference them in examples:

**Problem 1:** How do you teach complex systems without overwhelming players?
**Problem 2:** How do you maintain engagement for experienced players during tutorials?

**Example Game - Problem 1 & 2:** Shows how the game addresses both problems simultaneously

## Secondary Examples Best Practices

Group games by similarity to main examples rather than listing randomly:

```markdown
**Similar to Portal (environmental teaching):**
- The Witness
- Environmental Station Alpha
- Stephen's Sausage Roll

**Similar to Civilization VI (progressive unlocks):**
- Europa Universalis IV
- Crusader Kings III
- Total War: Warhammer
```

## Migration from First Edition

If you have existing First Edition patterns, you can enhance them by:

1. **Add Descriptive Title** - Usually obvious from context
2. **Define Audience** - Think about who the pattern works best for
3. **Expand Context** - When/where is this pattern most effective?
4. **Identify Consequences** - What else happens when you use this pattern?
5. **List Constraints** - What limits this pattern's applicability?
6. **Group Secondary Examples** - Organize existing examples better

## Template Selection Decision Tree

```
Do you need comprehensive documentation? 
├─ Yes → Enhanced Edition
│  ├─ Academic research? → Enhanced Edition
│  ├─ Professional development? → Enhanced Edition  
│  └─ Teaching/workshop context? → Enhanced Edition
└─ No → First Edition
   ├─ Quick prototyping? → First Edition
   ├─ Personal reference? → First Edition
   └─ Simple documentation? → First Edition
```

## Common Pitfalls

### Over-Engineering
- Don't add complexity just because the enhanced template allows it
- Empty sections are fine - not every pattern needs all fields filled

### Audience Over-Specification  
- Avoid overly narrow audience definitions unless there's clear evidence
- "Players familiar with fighting game inputs" is good specificity
- "Left-handed players born in March" is probably too specific

### Consequence Speculation
- Base consequences on observation or evidence when possible
- Distinguish between proven effects and theoretical ones
- Situational effects are often the most valuable insights

## Integration Tips

### With Existing Pattern Libraries
- Enhanced templates can coexist with first edition patterns
- Gradually enhance high-value patterns over time
- Maintain consistent keyword usage across template versions

### For Team Use
- Establish team conventions for audience definitions
- Create shared constraint categories relevant to your projects
- Regular review sessions to validate consequences based on implementation experience

This enhanced template provides significantly more detail and context while maintaining the essential structure and philosophy of the original pattern language approach.