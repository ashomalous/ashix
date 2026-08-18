{ inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.oh-my-posh = inputs.wrappers.wrappers.oh-my-posh.wrap {
      inherit pkgs;

      settings = {
        console_title_template = "{{ .Shell }} in {{ .Folder }}";
        version = 3;
        final_space = true;

        secondary_prompt = {
          template = "❯❯ ";
          foreground = "magenta";
          background = "transparent";
        };
        transient_prompt = {
          template = "❯ ";
          background = "transparent";
          foreground_templates = [
            "{{if gt .Code 0}}red{{end}}"
            "{{if eq .Code 0}}magenta{{end}}"
          ];
        };

        blocks = [
          {
            type = "prompt";
            alignment = "left";
            newline = true;

            segments = [
              {
                type = "text";
                style = "plain";
                template = ''
                  {{- if .Env.DEVSHELL_NAME -}}
                    {{- $parts := split "|" .Env.DEVSHELL_NAME -}}
                    {{- range $part := $parts -}}
                      {{- if $part -}}
                        {{- $sub := split "/" $part -}}
                        {{- if eq (len $sub) 2 -}}
                          <{{ index $sub "_1" }}>{{ index $sub "_0" }}</> <#7f849c>| </>
                        {{- end -}}
                      {{- end -}}
                    {{- end -}}
                  {{- end -}}
                '';
              }
              {
                type = "text";
                style = "plain";
                template = "{{ if and .Env.IN_NIX_SHELL (not .Env.DEVSHELL_NAME) }}<blue> nsh</> | {{ end }}";
              }
              {
                template = "{{ .Path }}";
                foreground = "blue";
                background = "transparent";
                type = "path";
                style = "plain";

                properties = {
                  cache_duration = "none";
                  style = "full";
                };
              }
              {
                template = " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}<yellow>*</>{{ end }}<cyan>{{ if gt .Behind 0 }}󰁅{{ end }}{{if gt .Ahead 0}}{{ end }}</>";
                foreground = "green";
                background = "transparent";
                type = "git";
                style = "plain";

                properties = {
                  cache_duration = "none";
                  branch_icon = "";
                  commit_icon = "@";
                  fetch_status = true;
                };
              }
            ];
          }
          {
            type = "rprompt";
            overflow = "hidden";

            segments = [
              {
                template = "{{ .FormattedMs }}";
                foreground = "yellow";
                background = "transparent";
                type = "executiontime";
                style = "plain";

                properties = {
                  cache_duration = "none";
                  threshold = 5000;
                };
              }
            ];
          }
          {
            type = "prompt";
            alignment = "left";
            newline = true;

            segments = [
              {
                template = "❯";
                background = "transparent";
                type = "text";
                style = "plain";

                foreground_templates = [
                  "{{if gt .Code 0}}red{{end}}"
                  "{{if eq .Code 0}}magenta{{end}}"
                ];

                properties.cache_duration = "none";
              }
            ];
          }
        ];
      };
    };
  };
}
