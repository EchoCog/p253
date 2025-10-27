# Game Design Pattern Template Documentation

This documentation explains the two game design pattern templates available in this repository, based on the work described in "Pattern Language for Game Design".

## Overview

These templates provide structured formats for documenting game design patterns - reusable solutions to common design problems in games. The templates are based on Christopher Alexander's architectural pattern language approach, adapted specifically for game design challenges.

## Template Editions

### First Edition Template
The **FirstEditionTemplate.md** follows the original structure described in the first edition of "Pattern Language for Game Design". This template has been proven effective through thousands of student-generated patterns and provides a solid foundation for pattern documentation.

#### Key Fields:
- **Name**: Memorable, evocative pattern identifier
- **Confidence**: 1-10 rating of pattern viability
- **Image**: Visual representation of the pattern concept
- **Authors**: Pattern creators
- **Design Problem**: The specific game design challenge addressed
- **Pattern Description**: Detailed explanation of the solution
- **Games that use this pattern**: Implementation examples from real games
- **Seed**: Original inspiration or exercise that led to the pattern
- **Related Patterns**: Connections to other patterns (parent, child, additive, subtractive, alternate)
- **Keywords**: Non-hierarchical linking terms

### Enhanced Edition Template
The **EnhancedEditionTemplate.md** includes all first edition fields plus additional elements that provide more specificity and utility based on experience with the pattern library.

#### New Fields Added:
- **Descriptive Title**: Short practical title clarifying the pattern name
- **Audience**: Demographic aspects defining effective player groups
- **Context and Consequences**: When to apply and what effects to expect
- **Constraints**: Internal (game design) and external (development) limitations
- **Additional Pattern Problems**: Support for patterns addressing multiple issues
- **Secondary Examples**: Games with similar implementations to main examples

## Usage Guidelines

### Choosing a Template
- **Use First Edition** for simpler documentation needs or when starting with pattern languages
- **Use Enhanced Edition** for comprehensive documentation, academic work, or professional game development contexts
- Both templates are valid - choose based on your needs and constraints

### Confidence Ratings
Rate patterns on a 1-10 scale:
- **1-3**: Experimental patterns, limited testing
- **4-6**: Patterns with some validation, situational effectiveness
- **7-8**: Well-tested patterns with broad applicability
- **9-10**: Foundational patterns with extensive validation

### Writing Guidelines

#### Design Problems
- State problems clearly and specifically
- Focus on player experience challenges
- Can be expressed as questions
- Should make the need for the pattern obvious

#### Pattern Descriptions
- Start with the format: "To [achieve effect], a designer may [take action] because [explanation]"
- Expand with multiple paragraphs
- Include nuance and detail
- Avoid over-simplification

#### Game Examples
- Choose diverse implementations
- Provide specific descriptions of how the pattern is applied
- Explain the resulting player dynamics
- Show how the pattern solves the stated problem

#### Related Patterns
- **Parent**: Required by this pattern to function
- **Child**: Suggested or required by this pattern
- **Additive**: Enhance this pattern's effects
- **Subtractive**: Mitigate or balance this pattern
- **Alternate**: Mutually exclusive or competing approaches

## Pattern Library Principles

### Pattern Scope
- Most patterns should solve a single, clear problem
- Additional problems can be noted but should be used sparingly
- Complex patterns should be broken down into simpler components when possible

### Examples Quality
Write good example descriptions:
✅ "This game uses the pattern in this particular way. By doing this, the game creates these dynamics in the player experience that solve the problem."

❌ "This game is about these cool things! In it players do these things that do not relate to the pattern. It uses these mechanics [comprehensive list unrelated to pattern]."

### Keyword Usage
- Include as many applicable keywords as possible
- 20 keywords is better than 5
- Ensure consistency across patterns
- Use keywords for non-hierarchical pattern linking

## File Organization

```
GameDesign/
├── Templates/
│   ├── FirstEditionTemplate.md
│   └── EnhancedEditionTemplate.md
└── Examples/
    ├── ProgressiveDisclosureFirstEdition.md
    └── ProgressiveDisclosureEnhanced.md
```

## Implementation Notes

### For Pattern Authors
1. Copy the appropriate template
2. Replace bracketed placeholders with actual content
3. Remove instructional text (in italics)
4. Focus on clarity and specificity
5. Test examples are accurate and diverse

### For Pattern Libraries
- Use consistent formatting across all patterns
- Maintain keyword standardization
- Regular review for accuracy and relevance
- Consider user experience for pattern discovery and navigation

### Integration with Existing Systems
These templates are designed to work with:
- Markdown-based documentation systems
- Pattern database applications
- Academic research on game design
- Professional game development workflows

## References

Based on work described in:
- "Pattern Language for Game Design" (First Edition)
- "Pattern Language for Game Design" (Enhanced Edition, in preparation)
- Christopher Alexander's "A Pattern Language" architectural methodology
- Pattern Library website implementations

The templates reflect experience with over 3,000 student-generated patterns and ongoing refinement of the pattern language approach for game design education and practice.