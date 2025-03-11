local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('tools.buildship', 'eclipse-buildship') {
  settings+: {
    description: "",
    name: "Eclipse Buildship: Eclipse Plug-ins for Gradle",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/buildship/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
    },
    orgs.newRepo('buildship') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "java-kotlin"
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "The Eclipse Plug-ins for Gradle project.",
      homepage: "",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://hooks.slack.com/services/T0316GWAW/B0458MSEV/*') {
          content_type: "json",
          events+: [
            "commit_comment",
            "create",
            "delete",
            "issue_comment",
            "issues",
            "milestone",
            "project_card",
            "pull_request_review",
            "push"
          ],
        },
      ],
    },
  ],
}
