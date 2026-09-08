function main(config) {
    if (!Array.isArray(config.rules)) {
        return config;
    }

    config.rules = config.rules.filter(function (rule) {
        if (typeof rule !== "string") {
            return true;
        }

        return rule.trim() !== "DOMAIN-SUFFIX,bing.com,飞鸟云";
    });

    return config;
}
