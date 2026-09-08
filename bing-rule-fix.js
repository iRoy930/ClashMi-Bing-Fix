function main(config) {
    if (!Array.isArray(config.rules)) {
        return config;
    }

    var newRules = [];

    for (var i = 0; i < config.rules.length; i++) {
        var rule = config.rules[i];

        if (typeof rule !== "string") {
            newRules.push(rule);
            continue;
        }

        var parts = rule.split(",");

        var ruleType = parts.length > 0 ? parts[0].trim().toUpperCase() : "";
        var domain = parts.length > 1 ? parts[1].trim().toLowerCase() : "";

        if (ruleType === "DOMAIN-SUFFIX" && domain === "bing.com") {
            continue;
        }

        newRules.push(rule);
    }

    config.rules = newRules;
    return config;
}
