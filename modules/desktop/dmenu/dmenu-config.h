/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom */
static int fuzzy = 1;                       /* -F  option; if 0, dmenu doesn't use fuzzy matching */
static int centered = 1;                    /* -c option; centers dmenu on screen */
static int min_width = 720;                 /* minimum width when centered */
static const unsigned int alpha = 0xff;     /* Amount of opacity. 0xff is opaque */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=12"
};
static const char *prompt = NULL;           /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*                        fg         bg       */
	[SchemeNorm]          = { "#bbbbbb", "#1b1e20" },
	[SchemeSel]           = { "#eeeeee", "#005577" },
	[SchemeSelHighlight]  = { "#ffc978", "#005577" },
	[SchemeNormHighlight] = { "#ffc978", "#1b1e20" },
	[SchemeOut]           = { "#000000", "#00ffff" },
};
static const unsigned int alphas[SchemeLast][2] = {
	[SchemeNorm] = { OPAQUE, alpha },
	[SchemeSel]  = { OPAQUE, alpha },
	[SchemeOut]  = { OPAQUE, alpha },
};
/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 11;
static unsigned int columns    = 3;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 2;
