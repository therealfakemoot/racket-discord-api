#lang racket/base

(provide EndpointStatus EndpointSm EndpointSmActive EndpointSmUpcoming)
(provide EndpointDiscord EndpointAPI EndpointGuilds EndpointChannels
         EndpointUsers EndpointGateway EndpointGatewayBot EndpointWebhooks)
(provide EndpointCDN EndpointCDNAttachments EndpointCDNAvatars EndpointCDNIcons
         EndpointCDNSplashes EndpointCDNChannelIcons)
(provide EndpointAuth EndpointLogin EndpointLogout EndpointVerify
         EndpointVerifyResend EndpointForgotPassword EndpointResetPassword
         EndpointRegister)
(provide EndpointVoice EndpointVoiceRegions EndpointVoiceIce)
(provide EndpointTutorial EndpointTutorialIndicators)
(provide EndpointTrack EndpointSso EndpointReport EndpointIntegrations)
(provide EndpointUser EndpointUserAvatar EndpointUserAvatarAnimated
         EndpointUserSettings EndpointUserGuild EndpointUserGuilds
         EndpointUserGuildSettings EndpointUserChannels EndpointUserDevices
         EndpointUserConnections EndpointUserNotes)
(provide EndpointGuild EndpointGuildChannels EndpointGuildMember
         EndpointGuildMembers EndpointGuildMemberRole EndpointGuildBan
         EndpointGuildBans EndpointGuildIntegration EndpointGuildIntegrations
         EndpointGuildIntegrationSync EndpointGuildRole EndpointGuildRoles
         EndpointGuildInvites EndpointGuildEmbed EndpointGuildPrune
         EndpointGuildIcon EndpointGuildSplash EndpointGuildWebhooks)
(provide EndpointChannel EndpointChannelPermission EndpointChannelPermissions
         EndpointChannelInvites EndpointChannelTyping EndpointChannelMessage
         EndpointChannelMessages EndpointChannelMessageAck
         EndpointChannelMessagesBulkDelete EndpointChannelMessagePin
         EndpointChannelMessagesPins EndpointChannelWebhooks)
(provide EndpointGroupIcon)
(provide EndpointWebhook EndpointWebhookToken)
(provide EndpointMessageReactionsAll EndpointMessageReactions
         EndpointMessageReaction)
(provide EndpointRelationships EndpointRelationshipsMutual EndpointRelationship)
(provide EndpointInvite)
(provide EndpointIntegrationsJoin)
(provide EndpointEmoji)
(provide EndpointOauth2 EndpointApplications EndpointApplicationsBot
         EndpointApplication)

(define APIVersion "6")

(define EndpointStatus                           "https://status.discordapp.com/api")
(define EndpointSm                               (string-append EndpointStatus "scheduled-maintenances/"))
(define EndpointSmActive                         (string-append EndpointSm     "active.json"))
(define EndpointSmUpcoming                       (string-append EndpointSm     "upcoming.json"))

(define EndpointDiscord                          "https://discordapp.com/")
(define EndpointAPI                              (string-append EndpointDiscord "api/v" APIVersion "/"))
(define EndpointGuilds                           (string-append EndpointAPI     "guilds/"))
(define EndpointChannels                         (string-append EndpointAPI     "channels/"))
(define EndpointUsers                            (string-append EndpointAPI     "users/"))
(define EndpointGateway                          (string-append EndpointAPI     "gateway"))
(define EndpointGatewayBot                       (string-append EndpointGateway "/bot"))
(define EndpointWebhooks                         (string-append EndpointAPI     "webhooks/"))

(define EndpointCDN                              "https://cdn.discordapp.com/")
(define EndpointCDNAttachments                   (string-append EndpointCDN "attachments/"))
(define EndpointCDNAvatars                       (string-append EndpointCDN "avatars/"))
(define EndpointCDNIcons                         (string-append EndpointCDN "icons/"))
(define EndpointCDNSplashes                      (string-append EndpointCDN "splashes/"))
(define EndpointCDNChannelIcons                  (string-append EndpointCDN "channel-icons/"))

(define EndpointAuth                             (string-append EndpointAPI  "auth/"))
(define EndpointLogin                            (string-append EndpointAuth "login"))
(define EndpointLogout                           (string-append EndpointAuth "logout"))
(define EndpointVerify                           (string-append EndpointAuth "verify"))
(define EndpointVerifyResend                     (string-append EndpointAuth "verify/resend"))
(define EndpointForgotPassword                   (string-append EndpointAuth "forgot"))
(define EndpointResetPassword                    (string-append EndpointAuth "reset"))
(define EndpointRegister                         (string-append EndpointAuth "register"))

(define EndpointVoice                            (string-append EndpointAPI   "/voice/"))
(define EndpointVoiceRegions                     (string-append EndpointVoice "regions"))
(define EndpointVoiceIce                         (string-append EndpointVoice "ice"))

(define EndpointTutorial                         (string-append EndpointAPI      "tutorial/"))
(define EndpointTutorialIndicators               (string-append EndpointTutorial "indicators"))

(define EndpointTrack                            (string-append EndpointAPI  "track"))
(define EndpointSso                              (string-append EndpointAPI  "sso"))
(define EndpointReport                           (string-append EndpointAPI "report"))
(define EndpointIntegrations                     (string-append EndpointAPI "integrations"))

(define (EndpointUser uID)                       (string-append EndpointUsers uID))
(define (EndpointUserAvatar uID aID)             (string-append EndpointCDNAvatars uID "/" aID ".png"))
(define (EndpointUserAvatarAnimated uID aID)     (string-append EndpointCDNAvatars uID "/" aID ".gif"))
(define (EndpointUserSettings uID)               (string-append EndpointUsers uID "/settings"))
(define (EndpointUserGuilds uID)                 (string-append EndpointUsers uID "/guilds"))
(define (EndpointUserGuild uID gID)              (string-append EndpointUsers uID "/guilds/" gID))
(define (EndpointUserGuildSettings uID gID)      (string-append EndpointUsers uID "/guilds/" gID "/settings"))
(define (EndpointUserChannels uID)               (string-append EndpointUsers uID "/channels"))
(define (EndpointUserDevices uID)                (string-append EndpointUsers uID "/devices"))
(define (EndpointUserConnections uID)            (string-append EndpointUsers uID "/connections"))
(define (EndpointUserNotes uID)                  (string-append EndpointUsers "@me/notes" uID))

(define (EndpointGuild gID)                      (string-append EndpointGuilds gID))
(define (EndpointGuildChannels gID)              (string-append EndpointGuilds gID "/channels"))
(define (EndpointGuildMembers gID)               (string-append EndpointGuilds gID "/members"))
(define (EndpointGuildMember gID uID)            (string-append EndpointGuilds gID "/members/" uID))
(define (EndpointGuildMemberRole gID uID rID)    (string-append EndpointGuilds gID "/members/" uID "/roles/" rID))
(define (EndpointGuildBans gID)                  (string-append EndpointGuilds gID "/bans"))
(define (EndpointGuildBan gID uID)               (string-append EndpointGuilds gID "/bans/" uID))
(define (EndpointGuildIntegrations gID)          (string-append EndpointGuilds gID "/integrations"))
(define (EndpointGuildIntegration gID iID)       (string-append EndpointGuilds gID "/integrations/" iID))
(define (EndpointGuildIntegrationSync gID iID)   (string-append EndpointGuilds gID "/integrations/" iID "/sync"))
(define (EndpointGuildRoles gID)                 (string-append EndpointGuilds gID "/roles"))
(define (EndpointGuildRole gID rID)              (string-append EndpointGuilds gID "/roles/" rID))
(define (EndpointGuildInvites gID)               (string-append EndpointGuilds gID "/invites"))
(define (EndpointGuildEmbed gID)                 (string-append EndpointGuilds gID "/embed"))
(define (EndpointGuildPrune gID)                 (string-append EndpointGuilds gID "/prune"))
(define (EndpointGuildIcon gID)                  (string-append EndpointCDNIcons gID "/" hash ".png"))
(define (EndpointGuildSplash gID)                (string-append EndpointCDNSplashes gID "/" hash ".png"))
(define (EndpointGuildWebhooks gID)              (string-append EndpointGuilds gID "/webhooks"))

(define (EndpointChannel cID)                    (string-append EndpointChannels cID))
(define (EndpointChannelPermissions cID)         (string-append EndpointChannels cID "/permissions"))
(define (EndpointChannelPermission cID tID)      (string-append EndpointChannels cID "/permissions/" tID))
(define (EndpointChannelInvites cID)             (string-append EndpointChannels cID "/invites"))
(define (EndpointChannelTyping cID)              (string-append EndpointChannels cID "/typing"))
(define (EndpointChannelMessages cID)            (string-append EndpointChannels cID "/messages"))
(define (EndpointChannelMessage cID mID)         (string-append EndpointChannels cID "/messages/" mID))
(define (EndpointChannelMessageAck cID mID)      (string-append EndpointChannels cID "/messages/" mID "/ack"))
(define (EndpointChannelMessagesBulkDelete cID)  (string-append (EndpointChannel cID) "/messages/bulk_delete"))
(define (EndpointChannelMessagesPins cID)        (string-append (EndpointChannel cID) "/pins"))
(define (EndpointChannelMessagePin cID mID)      (string-append (EndpointChannel cID) "/pins/" mID))
(define (EndpointChannelWebhooks cID)            (string-append (EndpointChannel cID) "/webhooks"))

(define (EndpointGroupIcon cID hash)             (string-append EndpointCDNChannelIcons cID "/" hash ".png"))

(define (EndpointWebhook wID)                    (string-append EndpointWebhooks wID))
(define (EndpointWebhookToken wID token)         (string-append EndpointWebhooks wID "/" token))

(define (EndpointMessageReactionsAll cID mID)    (string-append (EndpointChannelMessage cID mID) "/reactions"))
(define (EndpointMessageReactions cID mID eID)   (string-append (EndpointChannelMessage cID mID) "/reactions" eID))
(define (EndpointMessageReaction cID mID eID uID)(string-append (EndpointMessageReactions cID mID eID) "/" uID))

(define EndpointRelationships                    (string-append EndpointUsers "@me" "/relationships"))
(define (EndpointRelationshipsMutual uID)        (string-append EndpointUsers uID "/relationships"))
(define (EndpointRelationship uID)               (string-append (EndpointRelationships) "/" uID))

(define (EndpointInvite iID)                     (string-append EndpointAPI "invite/" iID))

(define (EndpointIntegrationsJoin iID)           (string-append EndpointAPI "integrations/" iID "/join"))

(define (EndpointEmoji eID)                      (string-append EndpointAPI "emojis/" eID ".png"))

(define EndpointOauth2                           (string-append EndpointAPI "oauth2/"))
(define EndpointApplications                     (string-append EndpointOauth2 "applications"))
(define (EndpointApplicationsBot aID)            (string-append EndpointApplications "/" aID "/bot"))
(define (EndpointApplication aID)                (string-append EndpointApplications "/" aID))