#lang racket/base

(define APIVersion "6")

(struct Endpoint
  (Status
   Sm
   SmActive
   SmUpcoming

   Discord
   API
   Guilds
   Channels
   Users
   Gateway
   GatewayBot
   Webhooks

   CDN
   CDNAttachments
   CDNAvatars
   CDNIcons
   CDNSplashes
   CDNChannelIcons

   Auth
   Login
   Logout
   Verify
   VerifyResend
   ForgotPassword
   ResetPassword
   Register

   Voice
   VoiceRegions
   VoiceIce

   Tutorial
   TutorialIndicators

   Track
   Sso
   Report
   Integrations

   User
   UserAvatar
   UserAvatarAnimated
   UserSettings
   UserGuilds
   UserGuild
   UserGuildSettings
   UserChannels
   UserDevices
   UserConnections
   UserNotes

   Guild
   GuildChannels
   GuildMembers
   GuildMember
   GuildMemberRole
   GuildBans
   GuildBan
   GuildIntegrations
   GuildIntegration
   GuildIntegrationSync
   GuildRoles
   GuildRole
   GuildInvites
   GuildEmbed
   GuildPrune
   GuildIcon
   GuildSplash
   GuildWebhooks

   Channel
   ChannelPermissions
   ChannelPermission
   ChannelInvites
   ChannelTyping
   ChannelMessages
   ChannelMessage
   ChannelMessageAck
   ChannelMessagesBulkDelete
   ChannelMessagesPins
   ChannelMessagePin
   ChannelWebhooks

   GroupIcon

   Webhook
   WebhookToken

   MessageReactions
   MessageReaction

   Relationships
   RelationshipsMutual
   Relationship

   Invite

   IntegrationsJoin

   Emoji

   Oauth2

   Applications
   ApplicationsBot
   Application
   ))

(define Endpoints
  (Endpoint
   "https://status.discordapp.com/api"
   (string-append Endpoint-Status "scheduled-maintenances/")
   (string-append Endpoint-Sm     "active.json")
   (string-append Endpoint-Sm     "upcoming.json")

   "https://discordapp.com/"
   (string-append Endpoint-Discord "api/v" APIVersion "/")
   (string-append Endpoint-API     "guilds/")
   (string-append Endpoint-API     "channels/")
   (string-append Endpoint-API     "users/")
   (string-append Endpoint-API     "gateway")
   (string-append Endpoint-Gateway "/bot")
   (string-append Endpoint-API     "webhooks/")

   "https://cdn.discordapp.com/"
   (string-append Endpoint-CDN "attachments/")
   (string-append Endpoint-CDN "avatars/")
   (string-append Endpoint-CDN "icons/")
   (string-append Endpoint-CDN "splashes/")
   (string-append Endpoint-CDN "channel-icons/")

   (string-append Endpoint-API  "auth/")
   (string-append Endpoint-Auth "login")
   (string-append Endpoint-Auth "logout")
   (string-append Endpoint-Auth "verify")
   (string-append Endpoint-Auth "verify/resend")
   (string-append Endpoint-Auth "forgot")
   (string-append Endpoint-Auth "reset")
   (string-append Endpoint-Auth "register")

   (string-append Endpoint-API   "/voice/")
   (string-append Endpoint-Voice "regions")
   (string-append Endpoint-Voice "ice")

   (string-append Endpoint-API      "tutorial/")
   (string-append Endpoint-Tutorial "indicators")

   (string-append Endpoint-API "track")
   (string-append Endpoint-API "sso")
   (string-append Endpoint-API "report")
   (string-append Endpoint-API "integrations")

   (lambda(uID)     (string-append Endpoint-Users uID))
   (lambda(uID aID) (string-append Endpoint-CDNAvatars uID "/" aID ".png"))
   (lambda(uID aID) (string-append Endpoint-CDNAvatars uID "/" aID ".gif"))
   (lambda(uID)     (string-append Endpoint-Users uID "/settings"))
   (lambda(uID)     (string-append Endpoint-Users uID "/guilds"))
   (lambda(uID gID) (string-append Endpoint-Users uID "/guilds/" gID))
   (lambda(uID gID) (string-append Endpoint-Users uID "/guilds/" gID "/settings"))
   (lambda(uID)     (string-append Endpoint-Users uID "/channels"))
   (lambda(uID)     (string-append Endpoint-Users uID "/devices"))
   (lambda(uID)     (string-append Endpoint-Users uID "/connections"))
   (lambda(uID)     (string-append Endpoint-Users "@me/notes" uID))

   (lambda(gID)         (string-append Endpoint-Guilds gID))
   (lambda(gID)         (string-append Endpoint-Guilds gID "/invites"))
   (lambda(gID)         (string-append Endpoint-Guilds gID "/channels"))
   (lambda(gID)         (string-append Endpoint-Guilds gID "/members"))
   (lambda(gID uID)     (string-append Endpoint-Guilds gID "/members/" uID))
   (lambda(gID uID rID) (string-append Endpoint-Guilds gID "/members/" uID "/roles/" rID))
   (lambda(gID)         (string-append Endpoint-Guilds gID "/bans"))
   (lambda(gID uID)     (string-append Endpoint-Guilds gID "/bans/" uID))
   (lambda(gID)         (string-append Endpoint-Guilds gID "/integrations"))
   (lambda(gID iID)     (string-append Endpoint-Guilds gID "/integrations/" iID))
   (lambda(gID iID)     (string-append Endpoint-Guilds gID "/integrations/" iID "/sync"))
   (lambda(gID)         (string-append Endpoint-Guilds gID "/roles"))
   (lambda(gID rID)     (string-append Endpoint-Guilds gID "/roles/" rID))
   (lambda(gID)         (string-append Endpoint-Guilds gID "/invites"))
   (lambda(gID)         (string-append Endpoint-Guilds gID "/embed"))
   (lambda(gID)         (string-append Endpoint-Guilds gID "/prune"))
   (lambda(gID hash)    (string-append Endpoint-CDNIcons gID "/" hash ".png"))
   (lambda(gID hash)    (string-append Endpoint-CDNSplashes gID "/" hash ".png"))
   (lambda(gID)         (string-append Endpoint-Guilds gID "/webhooks"))

   (lambda(cID)     (string-append Endpoint-Channels cID))
   (lambda(cID)     (string-append Endpoint-Channels cID "/permissions"))
   (lambda(cID tID) (string-append Endpoint-Channels cID "/permissions/" tID))
   (lambda(cID)     (string-append Endpoint-Channels cID "/invites"))
   (lambda(cID)     (string-append Endpoint-Channels cID "/typing"))
   (lambda(cID)     (string-append Endpoint-Channels cID "/messages"))
   (lambda(cID mID) (string-append Endpoint-Channels cID "/messages/" mID))
   (lambda(cID mID) (string-append Endpoint-Channels cID "/messages/" mID "/ack"))
   (lambda(cID)     (string-append (Endpoint-Channel cID) "/messages/bulk_delete"))
   (lambda(cID)     (string-append (Endpoint-Channel cID) "/pins"))
   (lambda(cID mID) (string-append (Endpoint-Channel cID) "/pins/" mID))

   (lambda(cID hash) (string-append Endpoint-CDNChannelIcons cID "/" hash ".png"))

   (lambda(cID)       (string-append (Endpoint-Channel cID) "/webhooks"))
   (lambda(wID)       (string-append Endpoint-Webhooks wID))
   (lambda(wID token) (string-append Endpoint-Webhooks wID "/" token))

   (lambda(cID mID)
     (string-append (Endpoint-ChannelMessage cID mID) "/reactions"))
   (lambda(cID mID eID)
     (string-append (Endpoint-ChannelMessage cID mID) "/reactions" eID))
   (lambda(cID mID eID uID)
     (string-append (Endpoint-MessageReactions cID mID eID) "/" uID))

   (lambda()    (string-append Endpoint-Users "@me" "/relationships"))
   (lambda(uID) (string-append (Endpoint-Relationships) "/" uID))
   (lambda(uID) (string-append Endpoint-Users uID "/relationships"))

   (lambda(iID) (string-append Endpoint-API "invite/" iID))

   (lambda(iID) (string-append Endpoint-API "integrations/" iID "/join"))

   (lambda(eID) (string-append Endpoint-API "emojis/" eID ".png"))

   (string-append Endpoint-API    "oauth2/")
   (string-append Endpoint-Oauth2 "applications")
   (lambda(aID) (string-append Endpoint-Applications "/" aID))
   (lambda(aID) (string-append Endpoint-Applications "/" aID "/bot"))
   ))
