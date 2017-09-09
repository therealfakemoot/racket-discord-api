#lang racket/base

(struct MessageType ())

(struct Message
  (ID
    ChannelID
    Content
    Timestamp
    EditedTimestamp
    MentiionRoles
    Tts
    MentionEveryone
    Author
    Attachments
    Embeds
    Mentions
    Reactions
    Type))


(struct File
  (name
    ContentType
    Reader))

(struct MessageSend
  (Content
    Embed
    Tts
    Files
    File))

(struct MessageEdit
(Content
  Embed
  ID
  Channel))

(define (NewMessageEdit channelID messageID)
  (MessageEdit channelID messageID))

(struct MessageAttachment
  (ID
    URL
    ProxyURL
    Filename
    Width
    Height
    Size))

(struct MessageEmbedImage
  (URL
    ProxyURL
    Width
    Height))

(struct MessageEmbedVideo
  (URL
    ProxyURL
    Width
    Height))

(struct MessageEmbedProvider
  (URL
    Name))

(struct MessageEmbedAuthor
  (URL
    Name
    IconURL
    ProxyIconURL))

(struct MessageEmbedField
  (Name
    Value
    Inline))

(struct MessageEmbed
  (URL
    Type
    Title
    Description
    Timestamp
    Color
    Footer
    Image
    Thumbnail
    Video
    Provider
    Author
    Fields))

(struct MessageReactions
  (Count
    Me
    Emoji))
