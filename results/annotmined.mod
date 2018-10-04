!Experiment
evaluate:
- !AccuracyEvalTask
  desc: null
  eval_metrics: bleu
  hyp_file: !SavedFormatString {unformatted_value: 'results/{EXP}.test.hyp', value: results/annotmined.test.hyp}
  inference: null
  model: !Ref {default: 1928437192847, name: null, path: model}
  ref_file: conala-corpus/conala-test.snippet
  src_file: conala-corpus/conala-test.tmspm16000.intent
exp_global: !ExpGlobal
  bias_init: !ZeroInitializer {}
  commandline_args: &id001
    dynet_autobatch: null
    dynet_devices: null
    dynet_gpu: false
    dynet_gpu_ids: null
    dynet_gpus: null
    dynet_mem: '512'
    dynet_profiling: null
    dynet_seed: null
    dynet_viz: false
    dynet_weight_decay: null
    experiment_name: []
    experiments_file: C:/Users/E-Neo.DESKTOP-M4A5E83/Documents/NLP-Project/config/annotmined.yaml
    generate_doc: false
    resume: false
    settings: standard
  compute_report: false
  default_layer_dim: 512
  dropout: 0.3
  log_file: !SavedFormatString {unformatted_value: 'results/{EXP}.log', value: results/annotmined.log}
  loss_comb_method: sum
  model_file: !SavedFormatString {unformatted_value: 'results/{EXP}.mod', value: results/annotmined.mod}
  param_init: !GlorotInitializer {gain: 1.0}
  placeholders: {}
  save_num_checkpoints: 1
  truncate_dec_batches: false
  weight_noise: 0.0
model: !DefaultTranslator
  attender: !MlpAttender
    bias_init: !Ref {default: 1928437192847, name: null, path: exp_global.bias_init}
    hidden_dim: 512
    input_dim: 512
    param_init: !Ref {default: 1928437192847, name: null, path: exp_global.param_init}
    state_dim: 512
    truncate_dec_batches: false
    xnmt_subcol_name: MlpAttender.25615aaa
  compute_report: false
  decoder: !AutoRegressiveDecoder
    bridge: !CopyBridge {dec_dim: 512, dec_layers: 1}
    input_dim: 512
    input_feeding: true
    rnn: !UniLSTMSeqTransducer
      bias_init: !Ref {default: 1928437192847, name: null, path: exp_global.bias_init}
      decoder_input_dim: 512
      decoder_input_feeding: true
      dropout: 0.3
      hidden_dim: 512
      input_dim: 128
      layers: 1
      param_init: !Ref {default: 1928437192847, name: null, path: exp_global.param_init}
      weightnoise_std: 0.0
      xnmt_subcol_name: UniLSTMSeqTransducer.e8f982cd
    scorer: !Softmax
      bias_init: !Ref {default: 1928437192847, name: null, path: exp_global.bias_init}
      input_dim: 512
      label_smoothing: 0.0
      output_projector: !Linear
        bias: true
        bias_init: !Ref {default: 1928437192847, name: null, path: exp_global.bias_init}
        input_dim: 512
        output_dim: 12741
        param_init: !Ref {default: 1928437192847, name: null, path: exp_global.param_init}
        xnmt_subcol_name: Linear.ce949de1
      param_init: !Ref {default: 1928437192847, name: null, path: exp_global.param_init}
      trg_reader: !Ref {default: 1928437192847, name: null, path: model.trg_reader}
      vocab: null
      vocab_size: null
      xnmt_subcol_name: Softmax.e26005fb
    transform: !AuxNonLinear
      activation: tanh
      aux_input_dim: 512
      bias: true
      bias_init: !Ref {default: 1928437192847, name: null, path: exp_global.bias_init}
      input_dim: 512
      output_dim: 512
      param_init: !Ref {default: 1928437192847, name: null, path: exp_global.param_init}
      xnmt_subcol_name: AuxNonLinear.10699355
    trg_embed_dim: 128
    truncate_dec_batches: false
    xnmt_subcol_name: AutoRegressiveDecoder.bb17f9d6
  encoder: !BiLSTMSeqTransducer
    backward_layers:
    - !UniLSTMSeqTransducer
      bias_init: !Ref {default: 1928437192847, name: null, path: exp_global.bias_init}
      decoder_input_dim: null
      decoder_input_feeding: true
      dropout: 0.3
      hidden_dim: 256.0
      input_dim: 128
      layers: 1
      param_init: !Ref {default: 1928437192847, name: null, path: exp_global.param_init}
      weightnoise_std: 0.0
      xnmt_subcol_name: UniLSTMSeqTransducer.160063ef
    bias_init: !Ref {default: 1928437192847, name: null, path: exp_global.bias_init}
    dropout: 0.3
    forward_layers:
    - !UniLSTMSeqTransducer
      bias_init: !Ref {default: 1928437192847, name: null, path: exp_global.bias_init}
      decoder_input_dim: null
      decoder_input_feeding: true
      dropout: 0.3
      hidden_dim: 256.0
      input_dim: 128
      layers: 1
      param_init: !Ref {default: 1928437192847, name: null, path: exp_global.param_init}
      weightnoise_std: 0.0
      xnmt_subcol_name: UniLSTMSeqTransducer.599101a5
    hidden_dim: 512
    input_dim: 128
    layers: 1
    param_init: !Ref {default: 1928437192847, name: null, path: exp_global.param_init}
    weightnoise_std: 0.0
  inference: !AutoRegressiveInference
    batcher: !InOrderBatcher {batch_size: 1, pad_src_to_multiple: 1}
    max_num_sents: null
    max_src_len: null
    mode: onebest
    post_process: join-piece
    ref_file: null
    reporter: null
    search_strategy: !BeamSearch
      beam_size: 5
      len_norm: !PolynomialNormalization {apply_during_search: true, m: 1}
      max_len: 100
      one_best: true
      scores_proc: null
    src_file: null
    trg_file: null
  src_embedder: !SimpleWordEmbedder
    emb_dim: 128
    fix_norm: null
    param_init: !Ref {default: 1928437192847, name: null, path: exp_global.param_init}
    src_reader: !Ref {default: 1928437192847, name: null, path: model.src_reader}
    trg_reader: !Ref {default: 1928437192847, name: null, path: model.trg_reader}
    vocab: null
    vocab_size: 10383
    weight_noise: 0.0
    word_dropout: 0.0
    xnmt_subcol_name: SimpleWordEmbedder.ddfa221f
  src_reader: !PlainTextReader
    output_proc: []
    read_sent_len: false
    vocab: !Vocab
      i2w: [<s>, </s>, "\u2581sort", "\u2581list", "\u2581`", lst, '`', "\u2581based",
        "\u2581on", "\u2581each", "\u2581element", "\u2581'", s, "\u2581number", "\u2581\
          of", "\u2581occurrences", "\u2581Get", "\u2581the", "\u2581value", "\u2581\
          with", "\u2581maximum", "\u2581length", "\u2581in", "\u2581column", "\u2581\
          array", foo, "\u2581get", "\u2581count", "\u2581unique", Country, "\u2581\
          dataframe", df, "\u2581and", "\u2581store", "\u2581", "\u2581calculat",
        "\u2581difference", "\u2581between", "\u2581row", "\u2581previous", "\u2581\
          to", "\u2581it", data, "\u2581append", "\u2581values", '[', "\u25813", "\u2581,",
        "\u25814", "\u2581]", "\u2581a", "\u2581set", a, "\u2581every", "\u2581two",
        '-', "\u2581f", ar, "\u2581-", '1', "\u2581start", ing, "\u2581from", "\u2581\
          second", "\u2581rank", "\u2581rows", highest, "\u2581lowest", "\u2581grouped",
        "\u2581by", group, "\u2581according", value, "\u2581convert", "\u2581js",
        "\u2581date", "\u2581object", "\u258122", '2011', "\u2581GMT", "\u2581python",
        "\u2581datetime", "\u2581Convert", "\u2581binary", '16', '4', "\u2581string",
        list, "\u2581insert", "\u2581at", "\u2581position", "\u2581`0`", "\u2581keys",
        "\u2581dictionary", the, dict, "\u2581into", "\u2581case", "\u2581insensitive",
        "\u2581pad", dog, "\u2581up", "\u25815", "\u2581characters", x, "\u2581check",
        "\u2581if", "\u2581type", "\u2581variable", "\u2581is", "\u2581dictionaries",
        L, "\u2581flat", "\u2581merge", "\u2581single", "\u2581dict", "\u2581pandas",
        "\u2581data", "\u2581frame", Peak, ascending, Weeks, descending, "\u2581order",
        "\u2581run", "\u2581code", contained, "\u2581``", "\u2581print", "\u2581(",
        Hello, "\u2581)", '''', "\u2581creating", '{', A, "\u2581:", "\u25811", C,
        B, "\u25812", D, "\u2581}", Creating, "\u2581all", "\u2581possible", "\u2581\
          combination", "\u2581items", "\u25812-", dimensional, "\u2581sum", "\u2581\
          columns", Y, '19', "\u2581after", "\u2581group", "\u2581Item", _, code,
        "\u2581.", "\u2581create", containing, "\u2581permutations", "\u2581b", "\u2581c",
        "\u2581d", "\u2581as", "\u2581tuples", "\u2581remove", "\u2581N", an, "\u2581\
          first", "\u2581directory", "\u2581path", "\u2581'/", First, /, Third, Four,
        th, F, if, "\u2581Replace", ;, line, "\u2581call", "\u2581bash", "\u2581command",
        "\u2581my", dir, "\u2581|", "\u2581md", '5', sum, "\u2581pipe", "\u2581hex",
        c, '2', '123', "\u2581ascii", "\u2581fields", "\u2581class", User, "\u2581\
          that", "\u2581are", marked, required, "\u2581index", "\u25810", ':', "\u2581\
          change", "\u2581integers", separated, "\u2581spaces", "\u2581int", "\u2581\
          find", "\u2581css", "\u2581selector", "\u2581input", "\u2581onclick", "\u2581\
          Python", "\u2581/", "\u2581Remove", "\u2581special", "\u2581character",
        "\u2581display", "\u2581pdf", "\u2581file", "\u2581has", been, downloaded,
        my, pdf, ., "\u2581replace", "\u2581backslashes", result, "\u2581empty", "\u2581\
          any", "\u2581NaN", "\u2581How", "\u2581do", "\u2581I", "\u2581?", "\u2581\
          sub", elements, "\u2581an", tree, "\u2581tree", "\u2581exclud", "\u2581\
          root", "\u2581can", "\u2581split", "\u2581parse", "\u2581move", "\u2581\
          end", "\u2581key", language, "\u2581not", "\u2581equal", en, your, "\u2581\
          zero", "\u2581produce", "\u2581pivot", "\u2581table", "\u2581using", "\u2581\
          datafram", "\u2581form", "\u2581axes", "\u2581result", doSomething, "\u2581\
          try", except, "\u2581without", "\u2581handling", "\u2581exception", d, M,
        dt, "\u2581micro", time, "\u2581select", "\u2581where", column, X, bigger,
        than, "\u2581or", "\u2581smaller", y, "\u2581lists", "\u2581inner", l, "\u2581\
          item", to, sort, "\u2581indices", ',', '0,', "\u2581numpy", arr, "\u2581\
          From", "\u2581multi", Index, ed, "\u2581within", "\u2581higher", one, two,
        "\u2581only", "\u2581specific", "\u2581multiindex", "\u2581match", "\u2581\
          sha", r, p, "\u2581followed", "\u2581letters", including, "\u2581accent",
        str, 1`, "\u2581regex", "\u2581Re", name, src, dst, "\u2581texts", "\u2581\
          tags", "\u2581tag", strong, "\u2581etree", some, tag, "\u2581lxml", "\u2581\
          Serialize", "\u2581its", "\u2581JSON", "\u2581formatted", "\u2581UTF", '-8',
        "\u2581encoded", "\u2581HTML", "\u2581response", response, "\u2581BeautifulSoup",
        "\u2581delete", filename, "\u2581next", greatest, "\u2581`2`", "\u2581numbers",
        num, type, "\u2581positive", com, "\u2581before", "\u2581negative", "\u2581\
          sorted", "\u2581respectively", "\u25816", "\u2581months", "\u2581today",
        "\u2581month", "\u2581calculate", "\u2581six", "\u2581current", things, "\u2581\
          nested", weight, "\u2581elements", "\u2581function", fn, "\u2581tak", "\u2581\
          parameter", "\u2581return", month, "\u2581read", "\u2581lines", "\u2581\
          csv", urls, eu, csv, "\u2581comprehension", "\u258111", "\u258119", "\u2581\
          digits", as, "\u2581tab", "\u2581'\\", t, "\u2581scalar", "\u2581multiply",
        "\u2581matrix", b, "\u2581trailing", "\u2581newline", "\u2581test", \, n,
        test, "\u2581\\", "\u2581right", "\u2581side", "\u2581left", Mac, EOL, Unix,
        text, "\u2581chunks", "\u258116", "\u2581unicode", 0\, bc, 1\, '80', ba, '0',
        "\u2581byte", "\u2581save", "\u2581json", "\u2581output", "\u2581url", "\u2018",
        "\u2581http", "\u2581//", search, twitter, json, "\u2581q", '=', hi, "\u2019",
        "\u2581Find", "\u2581flush", i, "\u2581Print", count, "\u2581space", "\u2581\
          preceding", "\u2581state", "\u2581Tkinter", Text, "\u2581widget", "\u2581i",
        e, disabled, string, "\u2581apply", "\u2581itertools", product, arrays, thousands,
        "\u2581separators", '255', men, mount, in, "\u2581for", "\u2581tuple", "\u2581\
          words", "\u2581query", "\u2581field", length, "\u2581django", "\u2581model",
        MyModel, dicts, which, ratio, "\u2581close", "\u2581global", "\u25811.7",
        '76', '95', '59', '75', "\u2581non", m, "\u2581A", "\u2581Z", formula, matrix,
        "\u2581coordinates", "\u2581three", "\u2581arrays", z, "\u2581minimum", "\u2581\
          text", "\u2581multiple", "\u2581found", "\u2581xpath", '*', '@', =', submit,
        "\u2581attribute", "\u2581whos", "\u2581selenium", "\u2581YAML", "\u2581example",
        yaml, "\u2581Sort", "\u2581align", "\u2581accordingly", "\u2581obtain", "\u2581\
          np", args, ort, "\u2581Getting", "\u2581YYYY", MM, DD, "\u2581urlencode",
        of, characters, like, $, "\u2581#", "\u2581=", "\u2581%", "\u2581^", Q, ^,
        '3,4', '6', "\u2581contains", "\u25819", "\u2581occurrence", myList, "\u2581\
          navigat", "\u2581webpage", "\u2581given", http, www, python, org, "\u2581\
          Selenium", "\u2581reverse", "\u2581extract", monkey, love, banana, ':3',
        "\u2581upper", "\u2581lower", case, "\u2581ASCII", "\u2581groupby", numeric,
        h, '9', 09, '98', "\u2581n", "\u2581appear", "\u2581four", ID, "\u2581Unzip",
        "\u2581combine", "\u2581retrieve", "\u2581Flask", "\u2581request", arri, age,
        "\u2581serialize", "\u2581pattern", Jun, "\u25812005", '3', PM, "\u2581format",
        "\u2581Y", "\u2581M", "\u2581p", "\u258128", AM, "\u2581absolute", "\u2581\
          folder", "\u2581filename", exist, GDB, Path, "\u2581Execute", "\u2581post",
        bin, post, che, ers, associated, link, "\u2581jinja", '11', '17', "\u2581\
          Change", "\u2581float", "\u2581then", al, ka, values, "\u2581max", "\u2581\
          leading", "\u2581zeros", Str, ip, "\u2581generate", "\u2581pairs", range,
        "\u2581regular", "\u2581expression", "\u2581matches", "\u2581'^", +, \\, '|\\',
        "\u2581+", "\u2581over", "\u2581matching", "\u2581multiline", "\u2581block",
        "\u2581Run", '2.', py, "\u2581location", path, "\u2581arguments", "\u2581\
          subprocess", "\u2581third", "\u2581Add", another, choice, choices, "\u2581\
          name", "\u2581canonical", "\u2581full", rd, "\u2581dot", "\u2581copy", "\u2581\
          content", file, txt, "\u2581random", "\u258112", "\u2581sequentially", "\u2581\
          rename", gdp, log, "\u2581beautiful", "\u2581soup", "\u2581html", soup,
        li, "\u2581inside", Male, Words, "\u2581punctuation", "\u2581Extract", "\u2581\
          substrings", "\u2581!", "\u2581strings", "\u2581repeating", "\u2581Create",
        "\u2581new", "\u2581sep", er, ated, "\u2581duplicate", "\u2581folders", "\u2581\
          zip", "\u2581ends", "\u2581word", input, "\u2581reduce", "\u2581Move", "\u2581\
          cursor", "\u2581pointer", "\u2581ints", "\u2581default", "\u2581encoding",
        utf, "\u2581Format", "\u2581time", "\u2581m", "\u2581H", "\u2581S", rabic,
        "\u2581minute", "\u2581interval", "\u2581access", "\u2581null", three, four,
        five, 2`, k, "\u2581front", "\u2581mean", "\u2581nonzero", dates, just, date,
        "\u2581join", "\u2581one", "\u2581blank", "\u2581expressions", "\u2581integer",
        "\u258124", '32', "\u2581comma", "\u2581pass", "\u2581keyword", function,
        "\u2581line", myfile, "\u2581round", "\u2581be", "\u2581another", "\u2581\
          sorting", "\u2581equivalent", "\u2581week", '2010', "\u2581ranges", '-10',
        "\u258115", "\u258150", '100', "\u2581different", "\u2581aggregat", "\u2581\
          functions", mean, "\u2581same", dummy, "\u2581lowercase", "\u2581utf", "\u2581\
          download", via, "\u2581FTP", "\u2581ftplib", "\u2581handle", url, fetch,
        "\u2581imaplib", "\u2581100", "\u2581make", "\u2581matplotlib", "\u2581plot",
        "\u2581legend", "\u2581put", "\u2581marker", "\u2581once", "\u2581intersection",
        "\u2581filter", "\u2581objects", Sample, "\u2581range", -01-01, "\u2581wise",
        "\u2581year", spam, numpy, linalg, norm, "\u2581escaped", "\u2581true", "\u2581\
          booleans", "\u2581True", "\u2581False", "\u2581size", "\u2581figure", fig,
        inches, "\u2581width", "\u2581height", w, "\u2581'5", you, example, "\u2581\
          Flatten", "\u2581named", "\u2581ISO", "\u2581UTC", "\u2581Merge", "\u2581\
          subtract", "\u2581universal", "\u2581mode", U, -16-, le, "\u2581open", "\u2581\
          io", "\u2581module", "\u2581Join", "\u2581similar", user, id, "\u2581both",
        "\u2581dataframes", "\u2581dimensions", "\u2581bytes", cc, xa, 6\, bb, abcd,
        "\u2581boolean", "\u2581defined", go, "\u2581xx", "\u2581escape", "\u2581\
          Save", plt, "\u2581svg", svg, "\u2581'./", modules, "\u2581x", axis, "\u2581\
          top", "\u2581Insert", "\u2581records", "\u2581bulk", "\u2581master", "\u2581\
          DB", "\u2581sqlite", cursor, "\u2581Match", zA, Z, "\u2581*", hex, String,
        "\u2581formatting", "\u2581Jinja", tags, "\u2581locally", "\u2581installed",
        "\u2581modules", most, "\u2581lexicographic", "\u2581Dataframe", "\u2581also",
        "\u2581present", "\u2581Reverse", map, "\u2581decode", readable, "\u2581literal",
        "\u2581'3", "\u2581str", "\u2581anchor", "\u2581begin", "\u2581hyperlink",
        //, "\u2581execute", "\u2581jar", Blender, "\u2581mysql", "\u2581database",
        "\u2581substring", tuple, "\u2581clamp", "\u2581floating", min, max, "\u2581\
          raw", "\u2581sql", "\u2581queue", "\u2581<", "\u2581here", "\u2581>", db,
        "\u2581sqlalchemy", flask, "\u2581app", "\u2581quit", "\u2581program", "\u2581\
          more", Evaluate, object, number, "\u2581getattr", "\u2581generator", "\u2581\
          Matplotlib", "\u2581clear", "\u2581write", total, P, place, "\u2581colon",
        "\u2581surround", "\u2581vowels", word, bar, array, "\u2581par", "\u2581comments",
        "\u2581hashtag", "\u2581points", "\u2581Parsing", html, google, "\u2581Strip",
        "\u2581urlsafe", "\u2581base", '64', uenc, "\u2581decrypt", ion, "\u2581conversion",
        "\u2581decimal", "\u2581'0", "\u2581prefix", "\u2581123", "\u2581no", "\u2581\
          mechanize", "\u2581Open", sample, sig, "\u2581load", om, "\u2581header",
        "\u2581setup", "\u2581smtp", "\u2581mail", "\u2581server", smtp, gmail, "\u2581\
          port", "\u2581revers", "\u2581correlat", "\u2581bits", "\u2581add", "\u2581\
          Iterat", "\u2581loops", "\u2581hours", "\u2581compile", "\u2581Visual",
        "\u2581Stud", io, "\u2581project", "\u2581through", source, bashrc, "\u2581\
          expand", aliases, "\u2581script", "\u2581addition", wards, "\u2581except",
        "\u2581flask", Basic, "\u2581session", ASCII, "\u2581List", "\u258110", "\u2581\
          use", "\u2581subplots", pyplot, row, item, "\u2581acc", or, "\u2581Split",
        "\u2581question", "\u2581mark", la, mation, consum, "\u2581look", behind,
        2\, "\u2581declare", variable, reverse, "\u2581sublists", "\u2581itself",
        alphanumeric, "\u2581unescape", "\u2581splitting", I, "\u2581u", "\u2581U",
        '&', "\u2581you", lu, v, "\u2581me", "\u2581disable", "\u2581logging", "\u2581\
          while", "\u2581running", "\u2581unit", "\u2581tests", Date, Obj, "\u2581\
          drop", start, remove, end, "\u2581Drop", "\u2581timeseries", "\u2581reset",
        so, "\u2581existing", "\u2581transfer", red, "\u2581getting", "\u2581structure",
        '1,2,3,4', "\u2581keep", List, "\u2581created", "\u2581duplicated", ness,
        "\u2581user", Member, "\u2581groups", "\u2581log", "\u2581level", "\u2581\
          dynamically", DEBUG, "\u2581restart", "\u2581application", "\u2581Concat",
        '424', '2344', "\u2581swap", "\u2581pair", graph, png, "\u2581resolution",
        "\u25811000", "\u2581dpi", "\u2581exist", ell, "\u2581consist", "\u2581equals",
        "\u2581enumerate", "\u2581how", "\u2581uniq", ify, "\u2581console", "\u2581\
          SQLAlchemy", "\u2581Shell", "\u2581Script", "\u2581excel", "\u2581unpack",
        "\u2581represent", "\u2581hexadecimal", ef, '7', "\u2581sequences", un, sorted,
        pre, yesterday, "\u2581filled", "\u2581names", World, lo, ha, sdfasdf, g,
        "\u2581ending", "\u258114", "\u2581sentences", "\u2581R", egular, "\u2581\
          sentence", fourth, "\u2581cut", "\u2581delimiter", option, state, "\u2581\
          appended", cool, ans, '...', "\u2581foo", koko, '*10', '-4', "\u2581tokens",
        "\u2581Chinese", "\u2581letter", "\u2581shell", rm, "\u2581some", "\u2581\
          background", "\u2581consecutive", "\u2581consonant", ENT, R, "\u2581executable",
        "\u2581under", "\u2581windows", "\u2581label", ax, "\u2581pyplot", '12', am,
        "\u2581DateTime", "\u2581image", jpg, "\u2581picture", "\u2581terminate",
        "\u2581status", "\u2581abort", "\u2581execution", "\u2581message", aa, "\u2581\
          errors", "\u2581lookahead", "\u2581working", Users, u, 'no', mylist, int,
        "\u2581contents", Example, "\u2581concatenate", 3\, '20', ac, ascii, worth,
        "\u2581build", "\u2581representation", lol, "\u2581proper", "\u2581representations",
        "\u2581Normalize", cp, '1252', "\u2581DataFrame", "\u2581Can", "\u2581numeric",
        "\u2581parentheses", "\u2581Check", first, second, "\u2581`1`", "\u2581exclude",
        "\u2581bigge", st, "\u2581indexes", "\u2581largest", "\u2581itemgetter", "\u2581\
          adjacent", '0,1,2', ls, direct, output, T, V, "\u2581day", "\u2581whole",
        car, manufacture, datetime, "\u2581white", nd, "\u2581e", destruct, "\u2581\
          variables", "\u2581have", "\u2581instances", is, "\u2581beginning", "\u2581\
          skip", "\u2581printing", seq, "\u2581greater", subkey, key, "\u2581per",
        "\u2581username", "\u2581GET", "\u2581Django", "\u2581pretty", print, "\u2581\
          ordered", o, "\u2581Con", "\u2581urls", "\u2581properly", "\u2581re", "\u2581\
          series", "\u2581bins", "\u2581bin", "\u2581contain", apple, "\u2581reading",
        delimited, "\u2581mac", "\u2581occurence", "\u2581basename", "\u2581starts",
        "\u2581'7", '8', "\u2581'9", '0,2', "\u2581Make", "\u2581scatter", "\u2581\
          rearrang", "\u2581average", ch, os, "\u2581predicate", condition, "\u2581\
          double", "\u2581utc", "\u2581timestamp", "\u2581panda", "\u2581lambda",
        "\u2581truth", last, "\u2581Fit", "\u2581K", means, "\u2581reshap", words,
        such, "\u2581come", "\u2581login", "\u2581site", site, admin, panel, index,
        "\u2581browser", "\u2581fetch", parent, "\u2581fall", "\u2581together", j,
        "\u2581changing", "\u2581permission", stat, S, IR, "\u2581stat", "\u2581argparse",
        associate, "\u2581flag", "\u2581shows", "\u2581we", corresponding, "\u2581\
          indicate", whether, "\u2581identical", "\u2581shape", "\u2581Pandas", "\u2581\
          Date", "\u2581checkbox", "\u2581webdriver", "\u2581determine", "\u2581id",
        box, Produce, "\u2581suit", able, "\u2581Unicode", N, AMPERSAND, APOSTROPHE,
        "\u2581s", "\u2581Parse", "\u2581codepoint", clean, empty, "\u2581slice",
        slice, div, "\u2581Beautiful", "\u2581Soup", func, old, new, "\u2581deep",
        "\u2581emoji", ud, '83', f, having, surrogate, "\u2581calling", myfunction,
        stackoverflow, Checking, "\u2581website", driver, "\u2581click", "\u2581href",
        javascript, attr, "\u2581alpha", "\u2581png", img, "\u2581st", yl, width,
        '300', px, "\u2581SQL", "\u2581statement", sql, myDict, "\u2581parameters",
        "\u2581CSV", Result, "\u2581separator", "\u2581update", globals, vars, "\u2581\
          args", mystring, "\u2581square", "\u2581brackets", var, "\u2581places",
        "\u2581less", "\u2581Filter", ng, "\u2581them", "\u2581font", matplotlib,
        "\u2581multiplication", wise, "\u2581labels", Current, Level, "\u2581db",
        "\u2581point", '3.2', it, "\u2581times", "\u2581missing", "\u2581var", js,
        obj, app, "\u2581debug", "\u2581nan", "\u2581stamp", "\u2581subset", Reset,
        "\u2581rounded", "\u2581off", "\u2581seperator", random, "\u25810.0", "\u2581\
          1.0", "\u2581page", "\u2581immediately", "\u2581see", "\u2581does", "\u2581\
          vowel", "\u2581Validate", "\u2581IP", "\u2581address", "\u2581Regex", "\u2581\
          distinct", "\u2581compar", textbox, "\u2581tkinter", "\u2581long", myNumber,
        "\u2581Spawn", "\u2581process", "\u2581C", ++, "\u2581their", anniversary,
        score, "\u2581tensor", "\u2581constants", "\u2581tensorflow", "\u2581sequence",
        "\u2581Set", none, "\u2581Do", cluster, "\u2581closest", "\u2581search", pattern,
        "\u2581factoriz", "\u2581floats", "\u2581derive", '-1', sep, '2012', Book,
        "\u2581primary", "\u2581digit", "\u2581exactly", digit, rial, tr, il, "\u2581\
          stdin", "\u2581context", My, "\u2581keywords", "\u2581beautifulsoup", "\u2581\
          host", '9000', "\u2581encode", xc, 4\, G, "\u2581but", "\u2581false", "\u2581\
          entries", hand, resultType, "\u2581member", "\u2581Decimal", "\u2581files",
        home, directory, INSERT, INTO, VALUES, size, "\u2581markdown", "\u2581zone",
        "\u2581Group", pub, "\u2581annotate", title, "\u2581Canvas", canvas, "\u2581\
          Initialize", "\u2581None", "\u2581dimension", "\u2581graph", "\u2581exe",
        Python, Job, "\u2581body", body, "\u2581part", "\u2581exclusive", pass, "\u2581\
          requests", "\u2581w", "\u2581GroupBy", "\u25817", mask, "\u2581comparison",
        "\u2581Tak", "\u2581results", awk, "\u2581just", TAA, "\u2581numerical", "\u2581\
          continuous", "\u2581simple", "\u2581way", "\u2581iterators", "\u2581last",
        business, "\u25812014", "\u2581certificate", https, net, re, "\u2581dropped",
        haystack, "\u2581char", field, "\u2581queryset", preserving, "\u2581canvas",
        baz, "\u2581extra", "\u2581commas", "\u2581specify", "\u2581local", myVar,
        "\u2581exists", ope, rand, iterator, "\u2581triplet", "\u2581rgb", "\u2581\
          components", "\u2581reversed", "\u2581inter", change, ab, ly, "\u2581assign",
        "\u2581commit", "\u2581changes", "\u2581executing", "\u2581selected", "\u2581\
          color", DA, push, button, "\u2581hash", day, rows, "\u2581strip", "\u2581\
          anywhere", Bo, at, aaabcabccd, "\u2581upload", "\u2581Mechanize", somekey,
        "\u2581hide", espeak, "\u2581symlink", testdir, Link, "\u2581support", "\u2581\
          ctypes", "\u2581library", "\u2581uploaded", "\u2581Google", "\u2581cloud",
        "\u2581storage", bucket, "\u2581bucket", "\u2581argument", AB, "\u2581whitespace",
        xs, ts, col, "\u2581colorbar", im, Card, "\u2581alphabetically", occurences,
        "\u2581lookup", "\u2581template", "\u2581duplicates", set, "\u2581landscape",
        "\u2581thing", everything, "\u2581slash", stored, '1.', "\u2581flattened",
        "\u2581record", "\u2581orm", chapter, "\u2581summ", "\u2581Converting", "\u2581\
          axis", "\u2581X", "\u2581among", "\u2581parent", In, struct, "\u2581child",
        "\u2581constructor", "\u2581Use", "\u2581agg", "\u2581operations", std, bob,
        gold, "\u2581writing", "\u2581Write", "\u2581String", "\u2581segments", "\u2581\
          relative", removing, "\u2581prompt", "\u2581drive", "\u2581auto", scrolled,
        "\u2581window", "\u2581gtk", "\u2581Represent", "\u2581'10", '05', proc, "\u2581\
          hold", zero, container, written, "\u2581matched", review, very, Import,
        ant, "\u2581Return", fname, content, lines, "\u2581types", Enter, "\u2581\
          placeholder", "\u2581txt", Region, "\u2581Name", "\u2581platform", "\u2581\
          OS", "\u2581finding", "\u2581collection", collection, "\u2581extracting",
        "\u2581mongo", descendant, "\u2581construct", cat, Bull, "\u2581suffix", "\u2581\
          Load", "\u2581may", profile, par, xxx, thing, Please, "\u2581enter", "\u2581\
          something", "\u25818", "\u2581padding", "\u2581around", "\u2581saved", "\u2581\
          iterate", "\u2581backslash", np, nan, assign, "\u2581abbreviation", Feature,
        "\u2581Display", "\u2581dropp", cross, "\u2581button", section, select, all,
        keys, tom, positions, along, "\u2581other", same, "\u2581Summing", Cookie,
        cookie, br, "\u2581bracket", "\u2581Sum", lists, "\u2581breaks", "\u2581Search",
        blabla, "\u2581play", "\u2581wav", "\u2581compare", "\u2581'\\\\", 0-9, "\u2581\
          ham", "\u2581import", "\u2581importlib", import, module, "\u2581classes",
        "\u2581already", "\u2581Generate", "\u2581transform", "\u2581aggregated",
        items, dic, "\u2581logarithmic", ally, "\u2581y", username, block, "\u2581\
          gzip", gz, either, "\u2581members", char, binarize, order, "\u2581define",
        something, "\u2581capital", ex, mple, "\u2581uppercase", "\u2581splitted",
        "\u2581customize", original, other, sh, dictionary, "\u2581cartesian", "\u2581\
          product", "\u2581wait", "\u2581driver", "\u258160", "\u2581seconds", "\u2581\
          throw", "\u2581No", Such, ElementException, "\u2581switch", frame, Name,
        '10', ':0', "\u2581frequency", Iterate, "\u2581Select", "\u2581B", "\u2581\
          repeat", "\u2581recursively", /2014, hello, "\u2581evaluate", "\u258130",
        "\u2581Copy", "\u2581scientific", "\u2581notation", "\u2581sparse", success,
        "\u2581complete", "\u2581logical", "\u2581xor", "\u2581alphabetical", "\u2581\
          cdf", "\u2581semicolon", "\u2581delimeter", instance, "\u2581sets", "\u2581\
          val", "\u2581un", signed, students, "\u2581onto", mark, "\u2581parsed",
        "\u2581sympy", "\u2581solve", "\u2581linear", "\u2581equations", "\u2581z",
        "\u2581best", bigdict, "\u2581entire", "\u2581resize", "\u2581compose", "\u2581\
          directly", "\u2581preced", succeed, eight, "\u2581precision", "\u3042",
        "\u2581Delete", "\u2581mul", ple, columnheading, "\u2581stripp", "\u2581os",
        cmd, "\u2581xlsxwriter", smth, 2/, E, '01', xlsx, Documents, demo, small,
        left, evenly, "\u2581cell", whitespace, postrophe, does, "\u2581this", technically,
        "\u2581works", "\u2581vers", us, setting, echo, "\u2581Encode", UTF, "\u2581\
          inherit", sequence, "\u2581randomly", "\u2581following", grep, six, tuples,
        "\u2581attributes", "\u2581py", "\u2581center", window, sci, "\u2581above",
        "\u2581v", ues, "\u2581out", uri, "\u2581GAE", "\u2581proportion", trace,
        queryresult, email, "\u2581focus", "\u2581instance", "\u2581Keep", "\u2581\
          49", "\u2581Key", "\u2581Value", "\u2581SQLite", abcdefg, etc, password,
        not, "\u2581g", "\u2581delimiters", "\u2581implicit", "\u2581headers", writer,
        "\u2581flatten", "\u258132", bit, fixed, YYYY, "\u2581timedelta", '1,0', "\u2581\
          0,1", '1,1', Importing, application, folder, "\u2581available", "\u2581\
          Slicing", "\u2581replacing", ABC, BrandName, "\u2581Subtract", alphabet,
        "\u2581chars", "\u2581rotate", "\u258145", "\u2581degrees", "\u2581pull",
        "\u2581redirected", Value, "\u2581Their", put, ation, "\u2581df", users, "\u2581\
          ids", "\u2581desired", "\u2581URI", "\u2581MY", URI, uthorization, "\u2581\
          token", escape, escaped, world, "\u2581DOT", ALL, "\u2581enabled", "\u2581\
          like", "\u2581individual", "\u2581sensitive", "\u2581custom", "\u25812.7",
        "\u2581terminal", "\u2581screen", "\u2581Linux", "\u2581external", "\u2581\
          commands", script, own, "\u2581instead", "\u2581respective", "\u2581ndarray",
        main, "\u2581POST", request, "\u2581else", mp, avi, "\u2581ignoring", "\u2581\
          braces", "\u2581quotes", ermanently, Desktop, "\u2581sin", "\u2581iso",
        rat, duck, q, uadmesh, "\u2581repeated", "\u2581'*", "\u2581total", food,
        colors, "\u2581operator", "\u2581Divid", abc, "\u2581de", "\u2581again", "\u2581\
          common", "\u2581paths", usr, "\u2581regard", per, sed, "\u2581reorder",
        '2,3', "\u2581Fast", est, positional, "\u2581Plot", 'true', 'false', "\u2581\
          rep", "\u2581bar", color, categorical, "\u2581kind", "\u2581cast", myString,
        "\u2581concatenat", "\u2581separate", None, "\u2581combin", "\u2581Class",
        "\u2581parsing", "\u2581xml", "\u2581namespace", "\u2581cased", '07', '13',
        "\u2581system", "\u2581nearest", '26', '.0005', '.005', "\u2581fill", Cat,
        "\u2581Log", info, "\u2581send", HTTP, /1.0, "\u2581200", OK, "\u2581socket",
        connection, "\u2581normalize", thisismylist, Age, "\u2581grab", model, "\u2581\
          passing", "\u2581hyphen", strings, "\u2581percent", "\u2581trim", "\u2581\
          Trimm", Bob, "\u2581cat", "\u2581condition", "\u2581datatype", "\u2581consider",
        read, "\u2581W", -8859-1, "\u2581enclos", "\u2581currency", cent, "\u2581\
          URL", referer, "\u2581subplot", "\u2581pylab", "\u2581dummies", "\u2581\
          delta", "\u2581comment", "\u2581converted", parts, "\u2581'+", "\u2581alphabetic",
        "\u2581union", results, "\u2581control", "\u2581Compare", "\u2581kill", make,
        exe, table, "\u2581periods", between, "\u2581prec", split, "\u2581fixed",
        "\u2581chunk", '|', "\u2581markup", pandas, "\u2581will", "\u2581fit", "\u2581\
          Selecting", "\u2581Element", label, "\u2581WebDriver", "\u2581weight", "\u2581\
          factor", "\u2581ordering", factor, "\u2581divisible", remainder, "\u2581\
          Concatenat", "\u2581NumPy", thefile, outfile, "\u2581Update", Mar, ley,
        "\u2581cookies", wikipedia, lib, ff, "\u2581identify", "\u2581additional",
        year, "\u2581rational", "\u2581What", "\u2581backward", "\u2581node", "\u2581\
          thread", MyStringHere, "\u2581period", embedded, "\u2581squared", "\u2581\
          Retrieve", "\u2581whitespaces", '84', "\u2581keyboard", "\u2581mouse", tail,
        "\u2581linux", '-0400', '2022', "\u2581version", "\u2581most", "\u2581pythonic",
        "\u2581Day", "\u2581old", "\u2581bread", today, float, "\u2581info", Log,
        level, sqlalchemy, page, Andr, "\u2581rounding", "\u2581place", "\u2581op",
        posite, "\u2581diagonal", "\u2581substitute", "\u2581limit", "\u258113.9499999",
        '9999', tsv, '~', train, '3.', "\u2581offset", hr, "\u2581ahead", '00', SELECT,
        FROM, WHERE, IN, dimensions, "\u2581arbitrary", Month, person, birth, "\u2581\
          fragment", "\u2581identifier", address, ext, "\u2581source", "\u2581error",
        "\u2581newlines", ond, "\u2581zipped", "\u2581div", "\u2581blocks", centroids,
        dim, hyper, "\u2581literals", aaa, bbb, ccc, ddd, eee, fff, "\u2581This",
        O, rb, "\u2581combinations", "\u2581validat", "\u2581positions", "\u2581Truncate",
        Test, "\u2581li", next, Lib, "\u2581img", Joe, Blow, overlapping, '73', "\u2581\
          '01", '010', "\u258121", attached, "\u2581self", "\u2581truncate", "\u2581\
          web", browser, "\u2581colour", "\u2581red", functions, "\u2581modify", "\u2581\
          wxpython", "\u2581grayscale", "\u2581pixels", image, "\u2581export", "\u2581\
          pyspark", mycsv, structure, ST, NAME, OP, 11/, '06', "\u2581My", "\u2581\
          transaction", "\u2581filtering", K, respective, "\u2581latex", "\u2581filters",
        force, linebreaks, "\u2581original", divided, "\u2581subdirectories", updated,
        columns, Node, "\u2581extension", "\u2581monitor", "\u2581pygame", '.5', "\u2581\
          3.5", times, "\u258120", "\u2581title", "\u2581age", tmp, January, "\u2581\
          2010", Week, "\u2581patterns", "\u2581outer", credentials, "\u2581password",
        "\u2581alternat", W, Terminating, City, "\u2581CPU", "\u2581RAM", "\u2581\
          usage", "\u2581memory", "\u2581r", agged, tt, names, 'null', "\u2581placeholders",
        changed, "\u2581whil", latin, "\u2581Exclude", "\u2581when", Escape, format,
        "\u2581dicts", ld, "\u2581pl", ca, holder, quarter, "\u2581foreign", "\u2581\
          link", "\u2581even", "\u2581Numpy", "\u2581alphanumeric", "\u2581Access",
        "\u2581environment", HOME, KEY, THAT, IGHT, EXIST, default, root, TEXT, arg,
        appears, "\u2581frequent", "\u2581proc", ad, fix, res, ips, "\u2581distribution",
        "\u25810.05", "\u25810.2", recurring, '34', 00\, stats, "\u2581Unpack", "\u2581\
          ev", oke, Popen, "\u2581power", "\u2581tabs", "\u2581Resample", "\u2581\
          hour", H, "\u2581averag", those, "\u2581rid", firstname, DATE, "\u2581accumulator",
        "\u2581'2013-1-25", prefix, "\u2581matlab", "\u2581engine", 3\\, '85', "\u2581\
          interleave", "\u2581occur", ec, es, objects, "\u2581so", up, become, "\u2581\
          heading", more, "\u2581alphabet", '233', op, happy, for, cats, and, "\u2581\
          structured", coherent, "\u2581Float", "\u2581Int", "\u2581property", property,
        ms, "\u2581milliseconds", "\u2581magnitude", "\u2581vector", payload, "\u2581\
          HTTP", "\u2581hdf", here, "\u2581your", "\u2581plus", '044', sequences,
        "\u2581escaping", val, Determine, process, "\u2581Null", "\u2581remaining",
        xml, "\u2581exp", "\u2581Exit", encoded, Fire, Shot, "\u258125", '29', "\u2581\
          security", "\u2581register", create, account, pkl, celsius, "\u2581symbol",
        "\u2581500", dT, 'True', reference, base, "\u2581204", "\u2581view", scaping,
        header, "\u2581Webdriver", indexed, "\u2581coalesc", "\u2581Unix", files,
        "\u25813-", zeros, "\u2581launch", "\u2581Enclose", This, "\u2581criteria",
        Entry, "\u2581inverse", "\u2581domain", host, xyz, '987', api, "\u2581invoke",
        "\u2581perl", ui, replace, pl, "\u2581dynamic", "\u2581scope", "\u2581computer",
        "\u2581shutdown", 'off', operating, rase, "\u2581monthly", "\u2581divide",
        con, version, "\u2581tmp", "\u2581substract", "\u2581minutes", letter, "\u2581\
          appropriate", "\u2581reference", "\u2581Last", "\u25812002", "\u25812012",
        Calling, "\u2581ls", command, "\u2581echo", "\u2581urllib", Season, "\u2581\
          vectorize", "\u2581operation", race, track, "\u2581go", "\u2581P", "\u2581\
          manual", raise, Error, "\u2581bad", happened, "\u2581know", "\u2581Manual",
        "\u2581ValueError", "\u2581hidden", "\u2581bug", "\u2581catch", "\u2581Exception",
        "\u2581expect", "\u2581runtime", specific, "\u2581assertion", Unexpected,
        distance, "\u2581distance", textarea, "\u2581ip", "\u2581Rearrang", "\u2581\
          mention", "\u2581__", init, __, "\u2581method", ct, "\u2581MySQL", "\u2581\
          AND", param, "\u2581efficiently", "\u2581Matlab", "\u2581Order", "\u2581\
          Two", "\u2581Combination", "\u2581Lists", "\u2581One", "\u2581Image", "\u2581\
          Dynamic", mptt, Component, lamp, "\u2581UPPER", "\u2581Is", "\u2581settings",
        "\u2581Pythonic", "\u2581OrderedDict", "\u2581In", "\u2581entities", "\u2581\
          many", many, "\u2581relation", "\u2581scroll", hysteresis, "\u2581curv",
        linear, "\u2581plots", "\u2581sibling", "\u2581config", "\u2581Max", "\u2581\
          Tuple", elev, ance, "\u2581namedtuple", Matplotlib, "\u2581there", "\u2581\
          dis", continuous, "\u2581was", "\u2581successful", "\u2581MySQLdb", Why,
        "\u2581ca", "\u2581scale", Using, "\u2581SOAP", "\u2581concrete", "\u2581\
          Click", Joining, "\u2581Table", "\u2581work", Inverse, '2.6', "\u2581rules",
        "\u2581D", imensional, "\u2581want", "\u2581stack", "\u2581DataFrames", ratings,
        "\u2581csr", "\u2581scipy", "\u2581Replac", loop, "\u2581pymongo", "\u2581\
          document", "\u2581loop", "\u2581Setting", "\u2581models", "\u2581linewidth",
        "\u2581hatch", "\u2581NaNs", "\u2581mismatche", "\u2581conditions", "\u2581\
          spark", "\u2581LIST", "\u2581BOM", "\u2581Pylons", tire, "\u2581sizes",
        Removing, dataframe, "\u2581XML", "\u2581TimeSeries", "\u2581pop", "\u2581\
          real", "\u2581home", "\u2581links", "\u2581Splitt", "\u2581Combine", "\u2581\
          2.4", recarray, "\u2581back", "\u2581translate", "\u25818601", "\u2581Custom",
        "\u2581Conditional", "\u2581replacement", pend, icular, "\u2581vectors", Changing,
        "\u2581hue", "\u2581PIL", "\u2581Windows", "\u2581parallel", "\u2581subdirectory",
        "\u2581configure", "\u2581Pyramid", "\u2581transformation", "\u2581OpenCV",
        "\u2581Unescap", "\u2581Characters", "\u2581Sym", links, "\u2581lin", regress,
        "\u2581Method", pct, "\u2581Sublime", "\u2581Text", "\u2581Exp", "\u2581Non",
        "\u2581quantile", "\u2581Fill", Na, anhattan, calculated, mv, "\u2581network",
        "\u2581caveat", "\u2581Comprehension", "\u2581Syntax", "\u2581Dump", pr, cess,
        lollll, omg, omggg, "\u2581etc", "\u2581Tornado", "\u2581Hex", agonal, "\u2581\
          Self", Organiz, "\u2581map", certain, "\u2581confusion", "\u2581Only", "\u2581\
          normal", "\u2581permitted", Axis, "\u2581PyPlot", "\u2581sales", "\u2581\
          turn", "\u2581App", "\u2581Engine", "\u2581Request", "\u2581URLs", ternary,
        "\u2581contour", "\u2581Map", "\u2581Type", "\u2581expected", "\u2581buffer",
        "\u2581Multiplication", '200', Best, nth, "\u2581traceback", "\u2581show",
        "\u2581standard", ization, "\u2581SVM", "\u2581scikit", learn, "\u25812.5",
        GROUP, "\u2581BY", "\u2581ORM", "\u2581aggregate", "\u2581optional", "\u2581\
          Groupby", "\u2581Range", "\u2581Values", "\u2581Array", "\u2581indexing",
        obscure, urface, "\u2581normalizing", "\u2581Efficient", "\u2581feature",
        duction, "\u2581Averag", "\u2581Transform", apply, "\u2581Data", "\u2581Frame",
        "\u2581Plotting", "\u2581MultiIndex", "\u2581Combin", "\u2581CharField", "\u2581\
          Count", "\u2581relationship", elsius, Accessing, "\u2581Normaliz", "\u2581L",
        ack, expects, "\u2581wrong", animation, margin, "\u2581exponential", "\u2581\
          scaled", "\u2581shortest", Printing, "\u2581Sub", "\u2581calculation", Take,
        "\u2581screenshot", "\u2581Mac", "\u2581Pymongo", "\u2581looking", VG, "\u2581\
          ElementTree", "\u2581nulls", "\u2581colors", findall, "\u2581capitalize",
        "\u2581IO", "\u2581Error", "\u2581stor", "\u2581pickle", "\u2581Celery", Django,
        "\u2581tasks", "\u2581Eclipse", "\u2581iterating", "\u2581dic", "\u2581Way",
        "\u2581Duplicate", "\u2581Index", "\u2581amount", LARGE, "\u2581perform",
        "\u2581extend", "\u2581Confus", "\u2581children", "\u2581Err", "\u258198",
        "\u2581Address", alert, "\u2581Ghost", Driver, "\u2581Dictionaries", "\u2581\
          several", "\u2581suppress", "\u2581statements", party, "\u2581libraries",
        "\u2581TextCtrl", "\u2581wxPython", Truth, "\u2581simpl", "\u2581Matching",
        "\u2581Captur", emoticons, easiest, "\u2581Multiple", "\u2581density", "\u2581\
          setting", "\u2581horizontal", "\u2581boxplots", particular, "\u2581shift",
        ove, "\u2581syntax", "\u2581nothing", "\u2581images", "\u2581NULL", "\u2581\
          Dictionary", "\u2581fast", "\u2581timeout", "\u2581unittest", "\u2581Perform",
        "\u2581cumulative", "\u2581Turn", "\u2581partial", Area, "\u2581Under", "\u2581\
          Curve", AUC, "\u2581Tags", "\u2581datastore", "\u2581Immutable", Multi,
        Dict, "\u2581Read", "\u2581prepend", "\u2581Doc", "\u2581rtf", "\u2581reader",
        "\u2581efficient", depending, "\u2581histogram", "\u2581dates", "\u2581Play",
        "\u2581Sound", "\u2581Dict", Vector, izer, "\u2581sklearn", Decision, Tree,
        Classifier, neous, "\u2581Conversion", "\u2581implement", jump, "\u2581Pygame",
        "\u2581sprites", "\u2581ceiling", Counting, "\u2581Clear", deleting, "\u2581\
          timer", "\u2581Template", "\u2581mongodb", based, view, "\u2581jpg", "\u2581\
          Detect", "\u2581Easie", Most, SQLAlchemy, "\u2581conditional", Unit, "\u2581\
          Delet", "\u2581Zip", "\u2581Html", "\u2581Nested", "\u2581Import", "\u2581\
          Multi", "\u2581scrolling", "\u2581deal", WithCopyWarning, More, "\u2581\
          elegant", "\u2581regexp", "\u2581quant", ifiers, "\u2581Average", "\u2581\
          Every", Three, "\u2581Columns", "\u2581testing", "\u2581Elegant", "\u2581\
          membership", "\u2581Sending", "\u2581TCP", "\u2581sockets", "\u2581Function",
        retrieving, POST, "\u2581RegEx", "\u2581addresses", "\u2581cropped", "\u2581\
          properties", "\u2581Perl", "\u2581Expressions", "\u2581Elements", "\u2581\
          Missing", "\u2581defin", "\u2581markers", "\u2581Redis", "\u2581draw", "\u2581\
          grid", "\u2581User", Agent, Url, "\u2581service", "\u2581QDialog", "\u2581\
          Main", Qt, "\u2581account", "\u2581Escap", "\u2581Call", "\u2581populate",
        "\u2581owner", "\u2581pywin", "\u2581parts", "\u2581MATLAB", mode, "\u2581\
          Pixelate", "\u2581With", "\u2581Pillow", "\u2581invalid", Looping, sunflower,
        "\u2581inheritance", ame, "\u2581Defin", "\u2581midpoint", "\u2581colormap",
        "\u2581plotting", "\u2581regression", "\u2581Object", iant, "\u2581Simple",
        "\u2581overwrite", "\u2581Series", "\u25813.1", "\u2581simultaneously", "\u2581\
          dtype", "\u2581PDF", "\u2581visible", "\u2581Ellips", oid, "\u2581aggregation",
        "\u2581rect", angular, "\u2581increase", "\u2581border", less, "\u2581Close",
        scroll, "\u2581updat", Summariz, initializing, "\u2581RDD", "\u2581PySpark",
        purpose, "\u2581resources", player, "\u2581game", "\u2581runs", "\u2581curve",
        "\u2581loglog", "\u2581email", during, "\u2581super", Trying, "\u2581major",
        ity, "\u2581Indexing", "\u2581slider", "\u2581used", "\u2581Firefox", "\u2581\
          plain", "\u2581Scrapy", "\u2581scrollbar", "\u2581speed", "\u2581take",
        "\u2581dataFrame", "\u2581force", "\u2581tick", SE, "\u2581Download", "\u2581\
          Seaborn", "\u2581secondary", Moving, "\u2581Lambda", "\u2581Comprehensions",
        "\u2581Customize", aximum, error, Bold, scratch, "\u25813.2", "\u2581phantomjs",
        "\u2581Append", PUT, "\u2581REST", "\u2581API", "\u2581levels", ElementTree,
        ping, "\u2581changed", "\u2581Subprocess", "\u2581Pipe", "\u2581valid", "\u2581\
          correspond", "\u2581ID", "\u2581unix", get, "\u2581eval", "\u2581oct", "\u2581\
          gradient", "\u2581glob", "\u2581book", "\u2581authors", phrases, "\u2581\
          timezone", Locat, "\u2581Logarithmic", "\u2581parenthesis", "\u2581xticks",
        "\u2581NLTK", "\u2581tokenizer", "\u2581counter", "\u2581Single", encountered,
        "\u2581messages", "\u2581Requests", "\u2581originate", "\u2581zope", "\u2581\
          package", "\u2581slope", "\u2581First", "\u2581Column", "\u2581postfix",
        "\u2581AST", "\u2581mixed", "\u2581region", "\u25812.0", "\u2581clip", polar,
        "\u2581avoid", "\u2581repetition", "\u2581Problems", trying, "\u2581Stor",
        "\u2581AxesSub", plot, "\u2581Implement", "\u2581Diff", Match, Patch, 2/3,
        "\u2581E", quivalent, "\u2581j", else, "\u2581angle", "\u2581Multiprocessing",
        "\u2581Reshap", "\u2581pick", "\u2581Bul", "\u2581The", "\u2581customiz",
        "\u2581marks", "\u2581spines", "\u2581ter", rain, "\u2581definition", "\u2581\
          IDLE", "\u2581interactive", "\u2581Size", "\u2581initialize", Generating,
        "\u2581MD", "\u2581checksum", "\u2581specified", "\u2581Colormap", "\u2581\
          Assign", "\u2581Logging", "\u2581MultiValue", KeyError, "\u2581Bootstrap",
        Field, "\u2581accumulat", "\u2581anything", "\u2581overlap", "\u2581figures",
        separately, SQL, Working, "\u2581Updat", Executing, "\u2581tables", "\u2581\
          Multipart", "\u2581authenticate", "\u2581public", "\u2581author", "\u2581\
          Code", "\u2581better", "\u2581declarative", "\u2581performance", "\u2581\
          drawing", caption, "\u2581box", "\u2581Line", "\u2581Reading", "\u2581Free",
        "\u2581dump", "\u2581few", "\u2581Background", "\u2581Tk", "\u2581transparent",
        "\u2581PyGTK", "\u2581PyC", airo, "\u2581Tuples", "\u2581min", "\u2581databases",
        "\u2581masks", "\u2581colours", "\u2581reduceByKey", "\u2581Eas", groupby,
        unnamed, "\u2581symbols", "\u2581FigureCanvas", "\u2581Panel", Horizontal,
        stacked, "\u2581chart", "\u2581Saving", "\u2581Problem", "\u2581Post", "\u2581\
          backreference", mplicit, "\u2581Compar", EncodeError, "\u2581minor", "\u2581\
          ticks", "\u2581sp", lice, "\u2581what", would, "\u2581easy", free, "\u2581\
          Complex", "\u2581openCV", "\u2581video", "\u2581saving", "\u2581Formatting",
        "\u2581justified", "\u25813.3", "\u2581Unique", "\u2581edit", "\u2581Construct",
        "\u2581percentage", "\u2581spars", "\u2581triple", "\u2581cum", ulate, "\u2581\
          threshold", "\u2581concise", "\u2581Resampl", pressing, "\u2581Button",
        "\u2581Inter", program, "\u2581communication", "\u2581Apply", "\u2581Control",
        fields, DataFrame, "\u2581Draw", think, "\u2581Number", "\u2581Show", "\u2581\
          gui", "\u2581Gtk", axes, "\u2581dec", ade, "\u2581satisfy", "\u2581Merg",
        "\u2581Modify", "\u2581Choice", "\u2581Model", Multiple, ChoiceField, "\u2581\
          rectangle", "\u2581explod", "\u2581Deploy", "\u2581half", "\u2581circle",
        "\u2581jsonify", "\u2581too", "\u2581virtualenv", "\u2581XPath", finity, ED,
        show, Security, "\u2581Attribute", "\u2581Framework", "\u2581MongoEngine",
        system, Secondary, twin, "\u2581QPushButton", "\u2581switching", "\u2581connect",
        "\u2581Database", "\u2581toggle", "\u2581Calcu", ate, onclick, "\u2581seaborn",
        palette, "\u2581widgets", "\u2581javascript", "\u2581stop", "\u2581ctrl",
        "\u2581Blueprint", "\u2581fix", "\u2581breaking", "\u2581subdomain", empir,
        ical, "\u2581radio", "\u2581slow", "\u25813.6", "\u2581now", undefined, cycle,
        euclidean, "\u2581Disable", radians, BS, "\u2581grouping", "\u2581intra",
        jinja, "\u2581correctly", Configuration, "\u2581style", "\u2581elementwise",
        "\u2581heatmap", "\u2581queries", "\u2581Pass", "\u2581psycopg", core, series,
        Time, Series, hstack, "\u2581Frequency", "\u2581Bigram", unpickle, from, "\u2581\
          wildcard", "\u2581cells", "\u2581Outer", "\u2581Writing", "\u2581prevent",
        '0001', '2001', lsxwriter, "\u2581bold", "\u2581traverse", "\u2581Generic",
        ForeignKey, "\u2581assignment", "\u2581slicing", "\u2581expire", due, activity,
        '-16', "\u2581substitutions", "\u2581documentation", "\u2581Sphinx", "\u2581\
          configuration", "\u2581Boolean", "\u2581Heroku", "\u2581SSH", "\u2581tunnel",
        "\u2581circumcent", delaunay, "\u2581t", riangulation, "\u2581generated",
        "\u2581Interactive", "\u2581sliders", Building, "\u2581Matrix", "\u2581Generator",
        "\u2581TensorFlow", "\u2581SymPy", ature, lambda, "\u2581boxplot", "\u2581\
          Speed", "\u2581restrict", "\u2581multiprocessing", "\u2581cookie", "\u2581\
          mock", "\u2581users", "\u2581Nose", "\u2581QuerySet", "\u2581FileField",
        "\u2581good", "\u2581combinat", "\u2581Break", "\u2581overwrit", "\u2581quick",
        "\u2581constraint", Today, Pandas, "\u2581imag", "\u2581bitmap", trick, "\u2581\
          increment", "\u2581PLS", "\u2581algorithm", "\u2581blurred", esterday, "\u2581\
          Random", "\u2581edge", "\u2581weird", "\u2581Integer", "\u2581architect",
        "\u2581apps", "\u2581serve", "\u2581static", "\u2581defaultdict", "\u2581\
          Library", "\u2581iPython", "\u2581PyQt", "\u2581pyqt", "\u2581HTTPS", "\u2581\
          INSERT", "\u2581Postgre", "\u2581dataset", Between, "\u2581Substrings",
        Context, "\u2581improve", "\u2581sprintf", "\u2581PHP", "\u2581bind", "\u2581\
          called", "\u2581step", "\u2581allow", "\u2581programatic", "\u2581connection",
        "\u2581Motif", "\u2581Gibb", "\u2581sample", "\u2581Deal", "\u2581creation",
        "\u2581Calculate", Centroid, "\u2581Excel", "\u2581xlrd", Offic, "\u2581formats",
        "\u2581errorbars", "\u2581polygon", "\u2581Rust", "\u2581averages", "\u2581\
          outliers", "\u2581interface", "\u2581Nest", "\u2581criterion", "\u2581refer",
        "\u2581repository", "\u2581declar", "\u2581unused", '1000', "\u2581tweet",
        "\u2581design", "\u2581mismatch", "\u2581complex", "\u2581units", "\u2581\
          seed", "\u2581passed", "\u2581redirect", "\u2581rule", savefig, maximized,
        "\u2581Linear", "\u2581pymc", "\u2581belief", "\u2581num", "\u2581mysqldb",
        "\u2581Searching", "\u2581Repeat", "\u2581Literal", "\u2581reshape", "\u2581\
          unknown", Scrolling, "\u2581down", separating, symlog, "\u2581View", "\u2581\
          Spark", padded, mplot, "\u2581stretch", "\u2581findall", "\u2581decoding",
        sequential, "\u2581combined", "\u2581An", aph, ic, "\u2581tell", "\u2581limited",
        "\u2581texture", "\u2581bars", edges, "\u2581Java", "\u2581Base", "\u2581\
          reproducible", "\u2581examples", "\u2581alternative", now, "\u2581proxy",
        "\u2581authentication", "\u2581chrome", "\u2581scatterplot", err, yerr, cron,
        yms, portion, located, "\u2581By", "\u2581issue", "\u2581rest", framework,
        "\u2581pressed", "\u2581Colorbar", "\u2581Redirect", volution, "\u2581client",
        "\u2581router", "\u2581SSL", unread, seen, "\u2581Ordered", "\u2581Counter",
        "\u2581timeserie", computation, "\u2581least", square, "\u2581imported", "\u2581\
          graphs", "\u2581unzip", "\u2581days", "\u2581Rotating", "\u2581Pyspark",
        "\u2581Subset", ting, "\u2581animate", "\u2581Axes", Image, "\u2581filtered",
        "\u2581POSIX", "\u2581selection", doesnt, "\u2581alternatives", "\u2581Bar",
        losing, "\u25812.6", contiguous, "\u2581Subplots", "\u2581visualiz", "\u2581\
          Capitaliz", "\u2581tools", "\u2581inset", "\u2581capture", "\u2581audio",
        "\u2581camera", webcam, "\u2581Issue", "\u2581To", "\u2581Obtain", "\u2581\
          hierarchy", "\u2581Strings", "\u2581File", achieve, MAX, generalize, "\u2581\
          Chart", "\u2581Overlay", "\u2581imshow", "\u2581gap", ero, "\u2581di", lation,
        "\u2581Scipy", temp, truthy, "\u2581vertic", "\u2581pyodbc", "\u2581Declar",
        "\u2581iterable", "\u2581gracefully", allback, NaN, against, "\u2581iterables",
        look, round, "\u2581trace", delete, Textbox, "\u2581Ubuntu", "\u2581Anno",
        "\u2581channel", "\u2581RGB", "\u2581include", "\u2581immediate", "\u2581\
          Duplicat", "\u2581outputs", binary, "\u2581unquote", urlencoded, "\u2581\
          Difference", "\u2581concatenation", "\u2581formatter", "\u2581Pivot", Authorization,
        "\u2581counts", said, notepad, "\u2581help", "\u2581final", "\u2581Case",
        "\u2581Point", "\u2581high", "\u2581lib", "\u2581synonym", Post, Handler,
        "\u2581Scikit", "\u2581KMeans", eaving, "\u2581tight", "\u2581layout", "\u2581\
          Figure", "\u2581sys", Unknown, "\u2581comparat", "\u2581Im", pos, msave,
        "\u2581Double", decoding, geocode, "\u2581serverside", "\u2581google", "\u2581\
          maps", "\u2581DST", "\u2581SUM", "\u2581face", "\u2581GTK", "\u2581serialization",
        strip, "\u2581exact", "\u2581respect", beautiful, "\u2581pythonically", "\u2581\
          '1234", "\u2581hover", "\u2581arrow", loud, "\u2581Many", "\u2581New", "\u2581\
          animation", "\u2581codons", "\u2581Expression", "\u2581detect", "\u2581\
          Condition", "\u2581designate", reach, referrer, "\u2581cherrypy", "\u2581\
          mid", "\u2581Feed", "\u2581Manipulat", "\u2581xlwt", "\u2581PID", "\u2581\
          elasticsearch", "\u2581arrows", "\u2581Arrow", colored, "\u2581options",
        "\u2581Recursive", continent, "\u2581large", ombinatorial, "\u2581merging",
        "\u2581adjust", "\u2581choices", "\u2581sign", "\u2581schema", savez, "\u2581\
          For", "\u2581Loop", Results, "\u2581Efficiently", "\u2581gradients", "\u2581\
          understand", "\u2581alternating", dashed, "\u2581PK", "\u2581faster", "\u2581\
          trans", "\u2581sublist", "\u2581Output", Base, "\u2581fail", varchar, "\u2581\
          pyparsing", "\u2581fashion", "\u2581ax", ylim, since, "\u2581must", "\u2581\
          Web", "\u2581simulat", "\u2581logged", "\u2581administrator", "\u2581Mean",
        Does, "\u2581blend", "\u2581circles", "\u2581Multiply", "\u2581Rows", "\u2581\
          Sparse", "\u2581Switch", "\u2581git", lives, "\u2581corner", aspect, gnuplot,
        "\u2581possibly", "\u2581websocket", "\u2581fetching", "\u2581pages", "\u2581\
          related", "\u2581Histogram", actually, Celery, cast, "\u2581Late", "\u2581\
          Entry", requires, "\u2581forwarding", "\u2581paramiko", "\u2581MYSQL", "\u2581\
          big", "\u2581done", "\u2581Flip", utomatically, "\u2581Start", Given, "\u2581\
          Time", "\u2581weekdays", "\u2581h", ierarchical, "\u2581Pycurl", "\u2581\
          bit", "\u2581ALL", BUT, LAST, "\u2581halt", "\u2581microsecond", "\u2581\
          component", "\u2581Rest", Set, "\u2581magic", nchor, "\u2581lock", "\u2581\
          Substitut", "\u2581Gevent", Padding, "\u2581curl", Norm, "\u2581fold", accumulat,
        "\u2581behavior", "\u2581shapes", "\u2581break", "\u2581little", "\u2581endian",
        "\u2581Compress", scii, tabular, "\u2581directories", "\u2581Paramiko", "\u2581\
          cancel", ling, "\u2581effective", "\u2581bytearray", "\u2581Identify", Additional,
        tact, "\u2581J", '00000000000', thonic, "\u2581target", "\u2581symbolic",
        soft, boxes, Config, "\u2581Separate", pivot, "\u2581Different", "\u2581LaTeX",
        ambig, ous, chromedriver, ubuntu, "\u2581FB", "\u2581Graph", bat, "\u2581\
          truncation", "\u2581recursion", Mail, "\u2581SMTP", Sender, Refused, "\u2581\
          530", "\u2581share", "\u2581Styl", "\u2581Pyside", "\u2581automatic", "\u2581\
          Built", "\u2581Keyboard", "\u2581Signal", Interrupts, "\u2581CherryPy",
        ccented, "\u2581Fixed", "\u2581Position", "\u2581structures", "\u2581Context",
        "\u2581dependent", "\u2581fullscreen", "\u2581lengths", "\u2581PNG", "\u2581\
          watch", "\u2581Named", "\u2581mo", ment, load, avg, "\u2581Cent", OS, LF,
        "\u2581CRLF", dimension, Unable, TAB, "\u2581Right", "\u2581Menu", Wavelet,
        "\u2581pack", ndarray, currency, recision, "\u2581100.0", "\u2581Evaluat",
        "\u2581mathematica", "\u2581formula", "\u2581QThread", "\u2581reject", Overflow,
        Starting, "\u2581methods", "\u2581infer", "\u2581Super", "\u2581moving", "\u2581\
          streaks", "\u2581vice", "\u2581versa", "\u2581meets", parser, "\u25812.6.6",
        "\u2581Datastore", "\u2581pie", "\u2581provided", "\u2581cursors", '2.7',
        "\u2581reason", vice, "\u2581should", GB, "\u2581midnight", "\u25813.4", "\u2581\
          discret", "\u2581Panda", "\u2581doub", "\u2581quote", "\u2581minidom", making,
        formatted, "\u2581Parent", Occurrence, "\u2581preserve", "\u2581apostr", "\u2581\
          curses", "\u2581difflib", "\u2581events", "\u2581fails", "\u2581Inheritance",
        "\u2581Percentage", "\u2581cube", Shortest, "\u2581these", "\u2581pool", "\u2581\
          redis", "\u2581Raw", Running, "\u2581co", integration, mial, "\u2581larger",
        "\u2581integrate", "\u2581Ajax", "\u2581applications", "\u2581million", "\u2581\
          exit", "\u2581Fullscreen", Faster, groups, until, "\u2581forward", "\u2581\
          actual", "\u2581Rotat", "\u2581routing", "\u2581Capture", "\u2581stdout",
        non, backend, "\u2581NodeJ", "\u2581plt", colorbar, "\u2581ignore", "\u2581\
          adapt", "\u2581crop", "\u2581Variable", "\u2581operators", "\u2581remote",
        Window, "\u2581substitution", "\u2581subsets", "\u2581Legend", "\u2581Mark",
        "\u2581On", ce, cell, "\u2581Mask", OpenCV, "\u2581years", "\u2581wrapped",
        "\u2581smooth", "\u2581V", sub, "\u2581Comma", "\u2581T", echnique, "\u2581\
          plural", "\u2581versions", "\u2581Row", setitem, "\u2581Round", af, Frame,
        Iteration, "\u2581k", "\u2581Limit", literals, "\u2581printed", Returning,
        Column, "\u2581Trans", position, "\u2581Animat", "\u2581ArtistAnimation",
        "\u2581similarity", "\u2581Preserv", "\u2581scaling", "\u2581slashes", Ignore,
        "\u2581tokenize", ence, fill, "\u2581hist", "\u2581Fetch", PAND, AS, "\u2581\
          Tensor", board, programmatically, "\u2581trouble", "\u2581duration", "\u2581\
          event", "\u2581QTreeView", Where, loc, "\u2581Consum", kinesis, "\u2581\
          stream", "\u2581Parameter", ized, Queries, "\u2581batch", Oracle, "\u2581\
          applie", "\u2581iloc", "\u2581postgresql", "\u2581Overrid", "\u2581initial",
        "\u2581ModelForm", "\u2581Hash", "\u2581differences", "\u2581ubuntu", "\u2581\
          Server", Calculating, "\u2581container", "\u2581SqlAlchemy", "\u2581ManyToMany",
        "\u2581going", Many, "\u2581Upload", "\u2581appengine", "\u2581radia", "\u2581\
          Polar", Axes, "\u2581UI", "\u2581reopen", repend, precision, Regex, "\u2581\
          Expansion", Parentheses, "\u2581Slashes", gree, dy, add, "\u2581information",
        "\u2581required", "\u2581Document", "\u2581mongoengine", "\u2581locat", "\u2581\
          xlim", "\u2581ylim", "\u2581printable", ash, "\u2581warnings", "\u2581compute",
        "\u2581correct", "\u2581archive", "\u2581fabric", "\u2581sudo", "\u2581Serializ",
        Want, "\u2581specifier", "\u2581clean", "\u2581tail", "\u2581comprehensions",
        "\u2581Align", "\u2581install", chinese, "\u2581Parameters", "\u2581fromfunction",
        filled, "\u2581builtin", "\u2581O", "\u2581xaxis", Turning, "\u2581reuse",
        "\u2581Py", glet, "\u2581Fix", nested, "\u2581why", "\u2581wo", "\u2581gray",
        "\u2581fan", GPIO, "\u2581Raspberry", "\u2581Pi", ircular, "\xA3", DecodeError,
        "\u2581All", "\u2581palindrome", "\u2581logic", scipy, "\u2581ratio", insensitive,
        "\u2581presence", inary, onkeypatch, "\u2581PyGObject", "\u2581transition",
        "\u2581Dot", "\u2581manipulation", '88', "\u2581Default", "\u2581sched", "\u2581\
          twisted", "\u2581weighted", "\u2581SCP", util, "\u25811.5", parse, HashMap,
        EmbeddedDocument, ListField, "\u2581agent", "\u2581release", "\u2581F", ault,
        "\u2581meta", "\u2581Browse", "\u2581TKinter", "\u2581cycle", "\u2581Node",
        "\u2581networkx", generating, Query, "\u2581pid", "\u2581polynomial", "\u2581\
          opencv", "\u2581Fail", "\u2581Resize", "\u2581Raster", '5,4,', '2,4,', "\u2581\
          Substring", "\u2581raising", bower, "\u2581manager", "\xF1", "\u2581matrices",
        points, "\u2581Dirty", "\u2581clause", "\u2581comprehensi", ble, CSS, Looking,
        OpenGL, "\u2581GL", RC, "\u2581Ctrl", "\u2581student", style, "\u2581Clean",
        "\u2581nice", "\u2581subparsers", "\u2581parser", "\u2581executed", "\u2581\
          push", "\u2581framework", "\u2581GPS", EX, DELETE, "\u2581Learning", Rate,
        Scheduler, "\u2581Keras", hon, "\u2581mass", unique, directly, "\u2581macro",
        "\u2581Cython", "\u2581subscript", elimiters, DOS, classes, "\u2581Cross",
        platform, "\u2581Watch", mar, izing, "\u2581Rectangle", GroupBy, "\u2581MatPlotLib",
        "\u2581constant", "\u2581uneditable", "\u2581focused", "\u2581entry", "\u2581\
          loc", "\u2581middle", "\u2581clone", "\u2581Revers", "\u2581belong", "\u2581\
          OneToOne", "\u2581padded", "\u2581Keys", "\u2581huge", "\u2581attach", "\u2581\
          debugger", "\u2581subproc", ically, INT, CHAR, cientific, MI, TM, "\u2581\
          hangs", "\u2581wrap", socket, "\u2581arrang", "\u2581Build", "\u2581warpPerspective",
        "\u2581numPy", "\u2581known", "\u2581alias", ANY, "\u2581Embedd", "\u2581\
          Connect", "\u2581slot", Button, Box, forms, "\u2581prepopulate", "\u2581\
          choice", "\u2581WIN", "\u2581cache", connector, "\u2581treat", HDFStore,
        "\u2581const", WITH, blue, "\u2581succinct", dns, Possible, "\u2581Route",
        "\u2581worker", explicitly, "\u2581MS", "\u2581Progress", "\u2581Graphs",
        "\u2581mount", "\u2581pexpect", control, decreasing, increasing, fontsize,
        "\u2581Wildcard", Encoding, "\u2581analyze", "\u2581interpreter", "\u2581\
          virtual", ricontour, ole, english, "\u2581Popen", ro, zombie, ub, vimeo,
        "\u2581Big", "\u2581Zero", "\u2581scrapy", "\u2581tweepy", "\u2581maximize",
        "\u2581icon", "\u2581main", "\u2581crypto", "\u2581NOT", "\u2581give", "\u2581\
          scales", "\u2581finishe", "\u2581Aggregat", ier, hical, "\u2581Any", "\u2581\
          decorator", can, "\u2581diagram", "\u2581modified", toolkit, Monday, "\u2581\
          Network", "\u2581sprite", "\u2581retrive", "\u2581bottle", "\u2581probabili",
        stic, Currency, "\u2581Specific", "\u2581globally", rpc, "\u2581ssh", "\u2581\
          Transparen", Heap, "\u2581Git", Hub, "\u2581php", "\u2581Choose", hash,
        implemented, "\u2581Arrays", lint, "\u2581arrange", "\u2581panels", "\u2581\
          ode", "\u2581Unit", "\u2581grow", opencv, ward, "\u2581spheres", "\u2581\
          Calculation", "\u2581pcap", imilarity, "\u2581customer", "\u2581features",
        Uploading, Response, "\u2581hostname", loads, "\u2581giv", "\u2581Large",
        uc, ian, Distance, grand, "\u2581started", "\u2581wheel", When, "\u2581ML",
        "\u2581Apache", "\u2581daily", "\u2581render", "\u2581fft", "\u2581namedtuples",
        "\u2581Rank", octet, stream, bunch, efficient, "\u2581combo", "\u2581autocompletion",
        "\u2581reliabl", "\u2581Heatmap", "\u2581Local", "\u2581mm", dd, yyyy, aware,
        "\u2581epoch", "\u2581Renam", "\u2581HEAD", "\u2581intercept", "\u2581small",
        ite, "\u2581Covert", "\u2581hiera", chical, "\u2581interpolation", "\u2581\
          option", Remove, "\u2581fork", "\u2581Interleav", "\u2581pixel", seismic,
        "\u2581wi", ggle, "\u2581wx", Grid, wxpython, "\u2581Q", ual, ative, ncluding,
        "\u2581404", "\u2581significant", social, auth, "\u2581connected", successfully,
        "\u2581cases", "\u2581Scale", symbol, "\u2581Pattern", "\u2581emb", ossing,
        "\u2581depth", "\u2581azim", uth, lower, "\u2581rendering", Item, "\u2581\
          Static", "\u2581Files", "\u2581Cherrypy", "\u2581matter", "\u2581pip", handle,
        "\u2581shuffle", "\u2581hid", "\u2581Correct", Op, "\u2581melt", "\u2581Lot",
        leaving, "\u2581viceversa", "\u2581thousand", "\u2581accept", expanded, "\u2581\
          encrypted", "\u2581numerically", "\u2581templates", ONLY, "\u2581joined",
        "\u2581RDDs", "\u2581caches", "\u2581reload", une, "\u2581kernel", Serialization,
        crossings, Hide, salt, openssl, compatible, "\u2581blow", fish, BC, PKCS,
        "\u2581redundant", "\u2581ticker", "\u2581shared", "\u2581hard", way, "\u2581\
          Top", "\u2581failing", "\u2581derivative", savetxt, Cumulative, "\u2581\
          optimize", menu, "\u2581QMenu", understanding, "\u2581Character", "\u2581\
          checking", "\u2581admin", rflow, "\u2581Back", ticks, "\u2581live", "\u2581\
          Scatter", "\u2581XP", "\u2581built", deadline, "\u2581dev", server, "\u2581\
          Year", Day, "\u2581spec", fic, 'yes', 1/0, "\u2581edges", counts, "\u2581\
          scraping", "\u2581Gradient", Boost, BaseE, stimator, "\u2581pdb", "\u2581\
          columnwise", "\u2581scan", "\u2581received", "\u2581frozenset", "\u2581\
          effect", "\u2581subclasses", "\u2581Un", Fetching, "\u2581recent", Peewee,
        "\u2581vertical", "\u2581mapping", "\u2581Shad", cells, "\u2581ftp", "\u2581\
          differently", airwise, "\u2581doctype", dom, minidom, ut, "\u2581section",
        suggestions, "\u2581o", pacity, "\u2581pseudo", terminal, "\u2581emulat",
        "\u2581serial", "\u2581Maintain", sta, nc, iation, "\u2581NAN", Expanding,
        "\u2581private", "\u2581menu", "\u2581Manipulati", 'on', "\u2581alter", "\u2581\
          embed", "\u2581PyQT", "\u2581zlib", recover, contains, "\u2581exceptions",
        "\u2581disabl", "\u2581ConfigParser", "\u2581closing", comand, "\u2581subprocesses",
        "\u2581triangle", "\u2581inline", "\u2581logger", ious, Downloading, "\u2581\
          Tensorflow", ies, "\u2581atoms", Duplicates, "\u2581Month", "\u2581Datetime",
        "\u2581recognize", "\u2581tty", "\u2581resiz", "\u2581buttons", inserted,
        "\u2581raise", supported, "\u2581Statsmodel", Computing, "\u2581diffs", "\u2581\
          Option", mmutable, "\u2581Pag", Making, spaced, "\u2581Facebook", friend,
        Social, OR, "\u2581Ad", "\u2581Rec", enforce, "\u2581oauth", "\u2581provider",
        "\u2581cards", deck, "\u2581SciPy", hypergeom, "\u2581dialog", Trailing, "\u2581\
          highlight", "\u2581streaming", riented, route, "\u2581native", LS, "\u2581\
          span", "\u2581unne", contour, "\u2581tornado", "\u2581processes", "\u2581\
          Slice", dictionaries, "\u2581Invalid", "\u2581frames", bus, "\u2581nltk",
        tokenize, "\u2581sent", "\u2581Populat", "\u2581beetwe", "\u2581openpyxl",
        "\u2581unsorted", "\u2581need", "\u2581Extension", "\u2581Organiz", "\u2581\
          quoted", "\u2581twice", "\u2581Bit", Redirecting, "\u2581std", TCL, "\u2581\
          repetitions", "\u2581allowed", "\u2581detection", "\u2581IPython", "\u2581\
          associati", ve, "\u2581iterator", Intersection, "\u2581Mass", SUSP, "\u2581\
          progress", "\u2581Equiv", el, "\u2581documents", "\u2581PyMongo", "\u2581\
          backup", "\u2581restore", "\u2581MongoDB", "\u2581kivy", "\u2581language",
        "\u2581pymssql", "\u2581mixin", "\u2581override", "\u2581fillna", character,
        ROLLBACK, "\u2581TestCase", "\u2581cause", "\u2581con", "\u2581violat", "\u2581\
          menubar", "\u2581urljoin", "\u2581spinn", align, "\u2581shorten", elif,
        pythonic, "\u2581sliced", "\u2581bitwise", "\u2581provide", scp, "\u2581Json",
        shade, hough, "\u2581cv", Selection, "\u2581Transpos", "\u2581Some", Count,
        repeated, "\u2581traversal", "\u2581disk", Grab, Receiv, "\u2581Broadcast",
        "\u2581Packet", mshow, "\u2581verify", barh, "\u2581invert", "\u2581datetimes",
        "\u2581stderr", eautifulsoup, "\u2581patch", "\u2581spreadsheet", "\u2581\
          firefox", "\u2581Opening", "\u2581askopenfilename", "\u2581assert", "\u2581\
          decorated", "\u2581IndexError", "\u2581xlsx", "\u2581categories", "\u2581\
          pygtk", "\u2581closed", "\u2581comp", act, "\u2581secure", anonymous, outside,
        Auth, "\u2581choose", fine, "\u2581mesh", "\u2581quickly", "\u2581Tick", Width,
        "\u2581bs", "\u2581descriptor", "\u2581Assignment", extract, "\u2581debugging",
        "\u2581PyCharm", truncate, "\u2581ensure", avoid, "\u2581em", "\u2581Test",
        "\u258164", hold, "\u2581concurrent", futures, "\u2581cars", "\u2581pycharm",
        tooltips, "\u2581procedure", "\u2581Ca", "\u2581Hid", "\u2581atomic", "\u2581\
          opener", "\u2581Individual", "\u2581Foreign", "\u2581textfile", "\u2581\
          JPEG", "\u2581teach", "\u2581beginner", "\u2581curly", "\u2581Automat",
        DB, "\u2581COUNT", nsensitive, Mismatch, '4.', WebKit, GP, "\u2581programming",
        "\u2581Repeated", "\u2581Times", "\u2581LIKE", "\u2581Buttons", "\u2581Global",
        "\u2581quotations", upper, "\u2581pure", Requests, zoomed, "\u2581bool", strncmp,
        aving, "\u2581initialization", "\u2581Pretty", Amazon, "\u2581boto", "\u2581\
          behaviour", "\u2581handler", "\u2581Mutl", threading, nyway, "\u2581cluster",
        "\u2581Reference", "\u2581REPL", dev, "\u2581grapheme", "\u2581typ", ments,
        "\u2581potential", complete, "\u2581assertDict", Contains, Sub, "\u2581docstrings",
        "\u2581equalize", "\u2581pipes", "\u2581abstract", sea, son, episode, "\u2581\
          heart", redefine, "\u2581subject", articles, expression, "\u2581slicer",
        "\u2581Handle", "\u2581Wait", Element, "\u2581Swapping", "\u2581Separat",
        "\u2581SOCKS", Sock, si, Py, "\u2581extent", ticklabels, grate, "\u2581gevent",
        Orient, latest, au, tifulSoup, liding, "\u2581rects", "\u2581issues", "\u2581\
          ttk", "\u2581treeview", "\u2581Vectorize", "\u2581spawn", "\u2581independent",
        "\u2581blit", "\u2581transparency", comprehension, "\u2581sole", "\u2581broken",
        "\u2581CSRF", erification, "\u2581failed", destructive, "\u2581showing", "\u2581\
          Mapp", "\u2581Crop", "\u2581dist", ortion, "\u2581observation", "\u2581\
          Navigat", about, lowable, "\u2581ReportLab", animated, "\u2581quiver", "\u2581\
          uneven", "\u2581Radio", oordinates, "\u2581strategy", Initializing, clipped,
        "\u2581pro", "\u2581Has", compression, ransparency, "\u2581Pixel", "\u2581\
          mutable", "\u2581HDF", "\u2581Sequence", "\u2581leave", gn, "\u2581LEN",
        "\u2581Items", "\u2581direct", "\u2581approach", "\u2581selective", "\u2581\
          mute", sounds, "\u2581ggplot", counterpart, "\u2581stem", "\u2581Tell",
        temperature, "\u2581Exponential", "\u2581fitting", "\u2581callable", Previous,
        Persistent, "\u2581Terminal", "\u2581Session", "\u2581strange", "\u2581cond",
        tion, using, "\u2581Prevent", "\u2581anti", alias, "\u2581PhantomJS", "\u2581\
          crosstab", Interpolation, basemap, "\u2581SyntaxError", utting, "\u2581\
          NotImplemented", eq, "\u2581filepath", "\u2581popular", "\u2581follow",
        "\u2581casting", "\u2581intersect", "\u2581Active", "\u2581Directory", "\u2581\
          Specify", dummies, "\u2581randomize", "\u2581ajax", simulate, unit, "\u2581\
          continue", "\u2581task", "\u2581Fabric", "\u2581receive", "\u2581Sunday",
        "\u2581Auto", "\u2581older", DATA, "\u2581Quick", "\u2581neighbor", "\u2581\
          tiling", "\u2581Pylab", threaded, "\u2581Intr", andles, tick, "\u2581charts",
        "\u2581scrape", "\u2581callback", "\u2581inherite", "\u2581below", "\u2581\
          CamelCase", "\u25811.4", "\u2581Improv", Binary, "\u2581Representation",
        Addition, "\u2581building", '57', uperimpos, "\u2581basemap", referen, tial,
        "\u2581authenticated", "\u2581stacktrace", eading, "\u2581bitstring", "\u2581\
          Objects", "\u2581scons", "\u2581rasterize", "\u2581blurr", "\u2581DateTimeField",
        within, "\u2581implementation", quiet, "\u2581verbose", amazon, "\u2581trigger",
        "\u2581latest", "\u2581heights", "\u2581Edit", "\u2581Contour", "\u2581scenario",
        "\u2581Color", "\u2581Follow", "\u2581RSS", crap, "\u2581quality", "\u2581\
          jpeg", "\u2581price", rest, "\u2581Part", crumbs, hile, "\u2581RFC", "\u2581\
          Comparison", "\u2581Word", "\u2581Length", conf, possible, "\u2581l", ookbehind,
        cha, '-1252', "\u2581cp", "\u2581Bottle", "\u2581dropna", "\u2581Another",
        "\u2581continuation", "\u2581Lookup", "\u2581Sin", "\u2581Co", Counter, "\u2581\
          longest", "\u2581namespaces", "\u2581buf", "\u2581Socket", "\u2581Enabl",
        "\u2581Promis", uous, "\u2581Mode", "\u2581maintain", "\u2581strict", "\u2581\
          Twitter", "\u2581Stream", "\u2581Tweepy", "\u2581persist", "\u2581got",
        unicode, debug, "\u2581stand", "\u2581Runtime", Warning, "\u2581compiled",
        "\u2581Vista", "\u2581subpatterns", "\u2581OR", where, "\u2581totals", "\u2581\
          pause", Safari, "\u2581timezones", Filtered, "\u2581poll", "\u2581vertically",
        "\u2581horizon", "\u2581locations", "\u2581transpose", rotate, orientation,
        Spaces, "\u2581maxima", "\u2581Opencv", az, ard, "\u2581nodes", Visualization,
        urlopen, "\u2581slug", ification, "\u2581subclass", widget, "\u2581reconstructi",
        "\u2581collaps", "\u2581accuracy", "\u2581Submit", bind, "\u2581Resiz", "\u2581\
          rotation", Reply, "\u2581Tweet", ns, Ch, unk, "\u2581Stan", ford, "\u2581\
          Recognize", NER, "\u2581Manager", "\u2581Increment", "\u2581cos", Middleware,
        "\u2581Response", "\u2581circular", "\u2581TIFF", "\u2581flags", declared,
        conda, "\u2581packages", ential, "\u2581ec", "\u2581category", "\u2581permute",
        "\u2581Traceback", "\u2581Reindex", "\u2581machine", "\u2581learning", "\u2581\
          automatically", Scatterplot, "\u2581suds", "\u25810.3", "\u2581Scrollbar",
        "\u2581Colored", "\u2581Proper", "\u2581maximal", isoformat, ver, "\u2581\
          Email", Domain, "\u2581mask", contain, "\u2581arange", linspace, "\u2581\
          Embed", "\u2581Render", "\u2581OptionMenu", "\u2581sizer", "\u2581workers",
        "\u2581Pool", "\u2581EST", putting, occurance, "\u2581generic", "\u2581fraction",
        ibraries, "\u2581Composit", "\u2581Sqlalchemy", follows, artist, stay, AL,
        "\u2581pan", ulerian, Tour, "\u2581UDP", "\u2581receiv", "\u2581packets",
        "\u2581clients", localhost, "\u2581Modul", imshow, idea, "\u2581staticmethod",
        ather, "\u2581partition", WTF, back, padding, "\u2581Long", "\u2581JavaScript",
        "\u2581Program", "\u2581broadcast", "\u2581duplicat", "\u2581produc", "\u2581\
          smallest", "\u2581styles", "\u2581fuzzy", "\u2581taskbar", Tkinter, "\u2581\
          area", "\u2581GUI", Decode, logical, "\u2581Basic", JIRA, "\u2581api", element,
        "\u2581SIGINT", Script, "\u2581Gunicorn", "\u2581Decid", "\u2581trend", "\u2581\
          naive", "\u2581basic", "\u2581Terminate", thread, "\u2581WSGI", "\u2581\
          human", "\u2581Learn", HMM, training, "\u2581couple", allauth, "\u2581Square",
        "\u2581Store", "\u2581datatypes", "\u2581Suds", rogrammatically, sync, "\u2581\
          Authenticate", "\u2581cron", tab, Lock, eth, SciPy, solving, "\u2581differ",
        "\u2581ipython", "\u2581Users", "\u2581rib", bon, "\u2581toolbar", "\u2581\
          executemany", unction, "\u2581mini", isinstance, "\u2581submenu", "\u2581\
          colums", "\u2581star", "\u2581G", "\u2581IMAP", ach, "\u2581Label", "\u2581\
          Retriev", "\u2581asynchronously", HttpRequest, "\u2581256", manti, ssa,
        "\u2581decrease", To, "\u2581Models", curses, "\u2581resampling", sampling,
        "\u2581heterogen", eous, "\u2581savefig", "\u2581bbox", tight, "\u2581pytz",
        "\u2581convolution", "\u2581probability", "\u25811.9", nboundLocalError, "\u2581\
          ts", "\u2581processing", "\u2581Categor", ize, TRIE, blocking, real, "\u2581\
          QText", Browser, dumps, "\u2581recarray", are, ring, ise, "\u2581fetchone",
        "\u2581permutation", utocorrelation, "\u2581Indices", "\u2581Pull", "\u2581\
          Tag", ov, mi, rn, "\u2581keras", "\u2581threads", ivariate, "\u2581Factor",
        "\u2581strftime", "\u2581locale", "\u2581Twisted", eferred, transform, "\u2581\
          TLS", SSL, peer, gram, ten, "\u2581own", "\u2581doctests", "\u2581ports",
        recv, "\u2581statistic", "\u2581decompress", "\u2581profile", "\u2581seem",
        "\u2581depend", wagger, "\u2581endpoints", "\u2581Kivy", "\u2581Send", "\u2581\
          broadcasting", "\u2581gunicorn", "\u2581startswith", LD, "\u2581stride",
        dupl, "\u2581interleaving", sleep, "\u2581pipeline", "\u2581answer", "\u2581\
          people", "\u2581CC", "\u2581NDB", Property, "\u2581Of", "\u2581Need", SubPlot,
        "\u2581maybe", graphic, "\u2581Recursively", itation, xN, piechart, "\u2581\
          removed", "\u2581autoscale", cyrillic, cumsum, "\u2581Cake", reload, initialise,
        "\u2581SCons", Command, "\u2581safe", "\u2581cross", "\u2581algorithms", SP,
        "\u2581smart", "\u2581Sqlite", "\u2581Operation", unable, "\u2581nx", write,
        ge, "\u2581Notebook", walk, "\u2581Smooth", urses, virtual, display, "\u2581\
          locate", "\u2581norm", by, "\u2581occurs", "\u2581dependan", solve, rosstab,
        Jen, kins, "\u2581Environment", "\u2581prefixed", "\u2581communicate", swift,
        "\u2581millisecond", "\u2581Sanitiz", "\u2581median", ijkstra, "\u2581Shape",
        "\u2581lots", Create, Populat, "\u2581meet", "\u2581makes", "\u2581dependencies",
        attachments, "\u2581coroutine", modify, "\u2581problems", "\u2581bounds",
        "\u2581querysets", "\u2581Syn", "\u2581phrases", unset, "\u2581csrf", "\u2581\
          Accept", "\u2581Standard", "\u2581beep", mother, speak, "\u2581signed",
        "\u2581Boxplot", entered, "\u2581Choos", tie, '-3.', coupled, "\u2581backend",
        pack, "\u2581react", router, "\u2581panel", "\u2581xlabel", "\u2581memoize",
        "\u2581instantiat", Vertical, getitem, "\u2581job", Identifier, "\u2581localized",
        good, "\u2581practice", "\u2581Ruby", any, Copying, "\u2581AWS", redshift,
        "\u2581Query", "\u2581Structure", playing, "\u2581alarm", "\u2581sound", "\u2581\
          sigmoid", "\u2581copie", crement, "\u2581compress", ne, gr, earson, "\u2581\
          Correlati", "\u2581PySerial", "\u2581MM", "\u2581forms", "\u2581recursive",
        "\u2581Cookie", Gtk, "\u2581timeit", "\u2581met", "\u2581java", "\u2581bindings",
        liner, financial, "\u2581percentile", '5,50', ',90', de, "\u2581interf", shutting,
        "\u2581Mouse", "\u2581silhouette", "\u2581subarrays", "\u2581ForeignKey",
        "\u2581Translat", byte, iple, remains, "\u2581internal", "\u2581sendline",
        Binarize, "\u2581Probability", Frequency, "\u2581Axis", "\u2581Grid", "\u2581\
          Irregular", "\u2581Space", "\u2581einsum", aligned, RegExp, "\u2581short",
        petitive, "\u2581cleanup", "\u2581Application", registration, "\u2581symmetric",
        "\u2581looping", nice, "\u2581DNA", "\u2581dash", "\u2581Gmail", "\u2581**",
        kwargs, offline, "\u2581env", hosts, "\u2581interpolate", "\u2581Sprite",
        sheets, "\u2581odd", "\u2581ones", "\u2581Squar", creenshot, "\u2581xmlrpc",
        "\u2581selectors", "\u2581NaT", "\u2581Indirect", "\u2581correlation", "\u2581\
          head", "\u2581Inline", "\u2581Admin", job, "\u2581aware", clim, "\u2581\
          Are", "\u2581downside", locals, Smallest, upon, "\u2581microseconds", "\u2581\
          Memc", "\u2581Determin", EXE, yInstaller, "\u2581EOF", entering, "\u2581\
          indent", alcon, "\u2581black", "\u2581cons", xpansion, "\u2581borders",
        "\u2581Javascript", "\u2581Exceptions", "\u2581QWeb", View, "\u2581Console",
        "\u2581distinguish", "\u2581subquery", "\u2581interpret", "\u2581free", enable,
        "\u2581fake", "\u2581safely", "\u2581AppleScript", "\u2581repeatedly", "\u2581\
          equality", Calendar, "\u2581Backslash", Quote, Reader, ordering, "\u2581\
          blocking", "\u2581SDK", "\u2581manner", sparse, "\u2581serializable", "\u2581\
          WordNet", "\u2581synset", "\u2581chat", '339', "\u2581Box", Xvfb, popularity,
        "\u2581Disabl", "\u2581Cheap", "\u2581social", "\u2581auth", "\u2581facebook",
        "\u2581iteration", "\u2581blur", faces, "\u2581permissions", "\u2581Shift",
        'False', "\u2581stylesheets", etree, strftime, "\u2581phrase", "\u2581connections",
        "\u2581Proxie", egenerate, decomposi, "\u2581facet", seaborn, "\u2581indicator",
        "\u2581Mathematica", "\u2581equation", "\u2581pyside", "\u2581Interpolat",
        "\u2581minimal", document, "\u2581sphinx", autodoc, Primary, +/, "\u2581shallow",
        "\u2581Thread", Mix, "\u2581SocketServer", "\u2581Julia", "\u2581SQLalchemy",
        matching, "\u2581Major", Minor, "\u2581Polygon", eployment, "\u2581tool",
        "\u2581dumps", preferred, "\u2581QComboBox", "\u2581QItemDelegate", "\u2581\
          let", "\u2581finish", urllib, BE, FOR, '1970', "\u2581manage", '128,128',
        ',3', "\u2581PySide", rainbow, "\u2581DateTimeIndex", Greed, "\u2581compressed",
        "\u2581Auth", "\u2581convention", strptime, "\u2581Numb", Pool, "\u2581clicked",
        UP, se, "\u2581cost", gtk, "\u2581drag", highlight, "\u2581Serial", "\u2581\
          readline", "\u2581priority", "\u2581sessions", aking, "\u2581enum", continue,
        "\u2581accumulative", "\u2581math", "\u2581presse", "\u2581Poly", DCollection,
        "\u2581Slic", "\u2581matpl", "\u2581longer", ever, "\u2581cmap", cm, gray,
        "\u2581128", "\u2581Invert", "\u2581superclass", "\u2581bi", directional,
        "\u2581messag", AMP, "\u2581bands", "\u2581imports", "\u2581jupyter", "\u2581\
          notebook", Friday, "\u2581redirection", open, bla, "\u2581Adapt", "\u2581\
          bisect", routine, "\u2581greenlet", "\u2581CGI", "\u2581active", "\u2581\
          Chrome", forcing, together, danger, "\u2581prod", "\u2581Images", "\u2581\
          HttpResponse", Redirect, urious, "\u2581Sys", export, Export, "\u2581pyramid",
        mod, wsgi, "\u2581rectangles", exi, sit, qcut, zier, "\u2581Understand", "\u2581\
          ==", "\u2581semantics", "\u2581Treeview", "\u2581exec", "\u2581ch", "\u2581\
          CloudFront", "\u2581Shorte", "\u2581Polymorphic", Child, ModelAdmin, Ticks,
        QueryDict, "\u2581phone", ontrolling, "\u2581referenc", "\u2581natural", "\u2581\
          XOR", "\u2581Batch", "\u2581Center", "\u2581origin", oncise, "\u2581coroutines",
        "\u2581asyncio", swap, 32-, "\u2581bootstrap", break, Scipy, ounded, "\u2581\
          Title", "\u2581closure", "\u2581cycles", "\u2581ipdb", "\u2581def", "\u2581\
          Haystack", QuerySet, "\u2581IntegerField", NET, defined, "\u2581board",
        "\u2581Algorithm", "\u2581Condens", "\u2581interactively", azoo, "\u2581docstring",
        "\u2581modul", "\u2581barplot", "\u2581gmtime", "\u2581LXML", "\u2581trade",
        "\u2581OHLC", RE, "\u2581shaped", "\u2581sc", ala, "\u2581unordered", "\u2581\
          System", current, ill, "\u2581Atomic", focus, gi, '+3', "\u2581debian",
        zing, deb, "\u2581pd", directed, "\u2581steps", rettify, "\u2581Alter", "\u2581\
          mx", "\u2581duplication", "\u2581Cells", Other, "\u2581Spreadsheet", "\u2581\
          holes", "\u2581Postgres", "\u2581Pretti", Doing, NA, "\u2581Pre", "\u2581\
          WT", dply, "\u2581WTForms", forever, "\u2581relations", Pipeline, RDD, toDF,
        "\u2581sq", gg, "\u2581pul", "\u2581propagat", NTFS, ry, "\u2581handlers",
        "\u2581filenames", exec, "\u2581triangula", tri, ass, andra, "\u2581cql",
        attribute, spacing, reduce, Jinja, "\u2581Widget", "\u2581GUID", "\u2581tar",
        BLOB, "\u2581extraction", "\u2581preprocess", rammatical, "\u2581AES", "\u2581\
          Cloud", "\u2581CR", UD, "\u2581Vectoriz", ntras, ategorical, "\u2581Variables",
        "\u2581finished", "\u2581floor", defaultdict, "\u2581clos", "\u2581loading",
        "\u258116-", Closed, "\u2581Bokeh", "\u2581resolve", NS, "\u2581Parallel",
        "\u2581jobs", Distribute, "\u2581vs", 64-, '24:00', matshow, "\u2581complement",
        parallelism, andor, "\u2581Refer", "\u2581ndb", dump, Would, "\u2581Suppress",
        "\u2581indicat", ale, nder, "\u2581Persian", "\u2581Real", "\u2581Explicit",
        "\u2581yaml", "\u25811.6", "\u2581dynamical", "\u2581scoped", ful, MultipleField,
        "\u2581route", "\u2581manipulat", "\u2581Pairwise", "\u2581programs", Hex,
        Collection, "\u2581subsequence", "\u2581findAll", "\u2581Headers", "\u2581\
          Platform", MIDI, Token, "\u2581TfidfVectorizer", Late, Callback, "\u2581\
          gaussian", "\u2581mung", anda, tory, "\u2581Mirror", "\u2581terms", "\u2581\
          Sympy", "\u2581asterisks", "\u2581Explorer", "\u2581codes", "\u2581loss",
        Phone, "\u2581Emoji", malformed, "\u2581consistently", "\u2581deleted", "\u2581\
          overload", Stacked, "\u2581unwanted", overlay, ations, "\u2581pycurl", Without,
        pt, Shuffle, "\u2581detail", "\u2581Loops", "\u2581fact", "\u2581Not", zip,
        "\u2581daemonize", "\u2581COM", calculating, cubic, "\u2581Twe", "\u2581Conf",
        idence, "\u2581Ellipse", catterplot, "\u2581signals", "\u2581idiomatic", Russian,
        "\u2581Port", teratively, Alias, ke, lite, "\u2581Block", "\u2581upsert",
        close, torrent, "\u2581dir", "\u2581obj", "\u2581latt", ice, "\u2581Hyperlinked",
        ModelSerializer, "\u2581multipart", "\u2581igraph", breakpoint, "\u2581low",
        "\u2581affect", commit, "\u2581Window", "\u2581contin", gency, accented, "\u2581\
          reflect", "\u2581unexpectedly", "\u2581mmap", "\u2581Numeric", "\u2581shuffling",
        permutat, "\u2581Source", uo, "\u2581preserved", "\u2581snippet", "\u2581\
          validate", "\u201C", "\u201D", "\u2581autoscal", "\u2581Argparse", "\u2581\
          nargs", interrupt, "\u2581inputs", Logger, compile, "\u2581desktop", VM,
        environ, "\u2581reordering", "\u2581arbitrar", ily, grouper, "\u2581rolling",
        Temporary, "\u2581DLL", "\u2581Win", "\u2581Stat", "\u2581del", "\u2581Imag",
        IS, "\u2581clustermap", "\u2581StopIteration", popup, "\u2581history", "\u2581\
          modification", "\u2581BASE", DIR, "\u2581Stop", "\u2581infinite", "\u2581\
          optparse", "\u2581Tor", "\u2581loggers", "\u2581ago", cgi, "\u2581QTcpS",
        erver, als, "\u2581Fraction", DTH, '.000', "\u2581depends", Hi, "\u2581listen",
        usb, "\u2581device", "\u2581shifted", Help, "\u2581Foreman", "\u2581paws",
        "\u2581managers", "\u2581manag", fit, "\u2581eigenvalue", mail, "\u2581quadmesh",
        "\u2581Rad", grams, "\u2581occu", "\u2581DictCursor", '**', "\u2581weirdness",
        "\u2581factorial", "\u2581later", "\u2581watchdog", Called, Process, "\u2581\
          sliding", "\u2581planes", "\u2581Idiom", rst, "\u2581functional", builtin,
        "\u2581dd", mm, hh, TIME, auto, "\u2581Miss", "\u2581pos", Versions, "\u2581\
          mutex", "\u2581Pop", "\u2581clusters", "\u2581NetworkX", "\u2581Attach",
        "\u2581caller", "\u2581instantiate", annotate, Communication, "\u2581diagonals",
        "\u2581interleaved", oop, estless, security, "\u2581metacharacters", "\u2581\
          determin", "\u2581metaclass", Programming, "\u2581trave", "\u2581Min", "\u2581\
          Sec", "\u2581multivariate", inning, "\u2581Prime", "\u2581Palindrom", raggable,
        "\u2581classifier", class, imp, "\u2581SWIG", Relative, "\u2581subfolder",
        resses, "\u2581internet", "\u2581Alchemy", "\u2581Sudo", "\u2581Password",
        "\u2581Solution", "\u2581telnet", "\u2581Scroll", "\u2581sine", "\u2581Pyqt",
        diagonal, "\u2581conf", "\u2581intervals", "\u2581Reduc", tions, mixture,
        without, "\u2581enable", "\u2581CORS", eroku, viv, "\u2581preview", "\u2581\
          packet", sniffed, "\u2581scapy", "\u2581Digit", "\u2581Numbers", "\u2581\
          Queryset", pipelines, ert, "\u2581Settin", "\u2581general", reset, "\u2581\
          Qt", "\u2581heat", jwt, "\u2581direction", "\u2581yield", "\u2581earl",
        Creation, iston, "\u2581restriction", "\u2581Forc", Spec, ified, "\u2581automate",
        egation, special, methods, Certificate, "\u2581PKCS", "\u2581envelop", "\u2581\
          Pick", stdout, "\u2581tz", convert, LM, glob, "\u2581Byte", phantomjs, "\u2581\
          blobstore", "\u2581attachment", FFT, "\u2581wave", form, "\u2581docker",
        "\u2581pre", existing, "\u2581iterrows", "\u2581postgres", "\u2581act", "\u2581\
          Avoid", apache, generation, "\u2581PLY", "\u2581SS", "\u2581fancy", TXT,
        "\u2581clipboard", "\u2581Permutation", "\u2581animat", "\u2581delay", RabbitMQ,
        "\u2581inequalities", "\u2581Statement", "\u2581Designer", getcwd, "\u2581\
          Input", "\u2581MRJob", grid, passes, "\u2581views", timestamp, "\u2581Trouble",
        "\u2581logs", ADD, grades, "\u2581ndim", Side, Var, Numpy, "\u2581Product",
        "\u2581DetailView", rewrite, "\u2581liner", "\u2581monkey", "\u2581pg", execute,
        "\u2581stereo", "\u2581snap", "\u2581QGraphics", weak, "\u2581uncompress",
        gzipped, "\u2581nosetest", unittest, "\u2581signal", slots, "\u2581Sheet",
        annotations, env, fabfile, rogramatically, "\u2581unexpected", "\u2581generation",
        initialized, "\u2581definitions", "\u2581alive", "\u2581discard", "\u2581\
          errorbar", "\u2581linestyle", "\u2581rc", Params, Focus, "\u2581unencode",
        "\u2581scramble", Pair, "\u2581End", "\u2581dll", "\u2581nonlinear", "\u2581\
          Verify", "\u2581Alpha", ject, "\u2581WM", "\u2581Blobstore", "\u2581margins",
        ntermediate, "\u2581De", "\u2581strat", match, Computer, "\u2581contact",
        "\u2581Validation", AAA, "\u2581Queue", latex, "\u2581cProfile", "\u2581substitut",
        "\u2581reactor", "\u2581declaration", "\u2581Kill", with, shuffle, "\u2581\
          corpus", "\u2581memoization", Abort, "\u2581subcommand", "\u2581scoping",
        "\u2581mixins", Advanced, "\u2581gra", nul, arity, "\u2581Design", "\u2581\
          GS", treamer, "\u2581plug", "\u2581NA", "\u2581DF", "\u2581ellipse", tinymce,
        shelf, "\u2581pcolor", "\u2581publication", "\u2581daemon", "\u2581Options",
        lot, much, genfromtxt, SimpleHTTPServer, "\u2581br", "\u2581Communicat", negative,
        "\u2581webapp", "\u2581recommend", though, "\u2581XS", LT, "\u2581convenient",
        "\u2581patches", "\u2581approximate", "\u2581periodic", "\u2581You", ube,
        "\u2581gdata", quir, "\u2581life", local, "\u2581extensions", mread, "\u2581\
          ZIP", "\u2581zipfile", software, cessing, sets, nome, scale, TK, INTER,
        "\u2581decimation", NG, "\u2581Listener", Status, API, "\u25815000", "\u2581\
          hit", stogram, layers, "\u2581Decod", Print, launched, "\u2581*.", English,
        "\u2581verb", Left, heads, Online, patching, "\u2581curves", "\u2581mutual",
        "\u2581Enumeration", "\u2581coerc", ounce, "\u2581strptime", Re, pe, "\u2581\
          Listbox", "\u2581sphere", "\u2581smtplib", projects, has, Instantiate, LOG,
        "\u2581Caffe", "\u2581Configur", "\u2581wrapp", "\u2581collections", ive,
        "\u2581plugins", statements, "\u2581bitfield", finite, "\u2581dropdown", len,
        "\u2581production", "\u2581instant", NoneType, encode, "\u2581twitter", scrapping,
        "\u2581MA", NIF, EST, "\u2581jsonpickle", Bayes, "\u2581PyMC", generated,
        archive, "\u2581action", "\u2581happen", edge, "\u2581Names", "\u2581Cell",
        "\u2581failure", Alphabet, "\u2581injected", Central, Widget, "\u2581MainWindow",
        "\u2581Restart", "\u2581blob", dot, ish, Force, dependent, variance, "\u2581\
          populated", "\u2581volume", "\u2581mayavi", "\u2581enumerat", "\u2581tarfile",
        sensitivity, "\u2581polling", "\u2581submodule", "\u2581Jupyter", itting,
        consecutive, "\u2581Path", "\u2581parametrize", averag, SQLalchemy, "\u2581\
          distances", "\u2581optimal", "\u2581Wx", "\u2581suppo", "\u2581who", "\u2581\
          asks", nstead, "\u2581DJango", "\u2581wit", "\u2581memcache", "\u2581deploy",
        Serializer, "\u2581threading", timedelta, pipe, "\u2581Annotat", "\u2581Explain",
        hot, encoder, wanted, fromkeys, usable, "\u2581exits", apps, "\u2581easi",
        "\u2581Boto", "\u2581resource", "\u2581Elasticsearch", "\u2581PyE", acu, um,
        rf, created, "\u2581QObject", "\u2581hexbin", "\u2581ZODB", "\u2581masked",
        "\u2581laz", "\u2581validation", "\u2581Insta", "\u2581smoothly", install,
        "\u2581egg", "\u2581plugin", "\u2581interact", "\u2581pret", ending, "\u2581\
          libsvm", scikit, "\u2581Try", Except, template, filter, Order, Scann, Keypress,
        responding, "\u2581Sklearn", "\u2581wavfile", safe, "\u2581overlay", ordered,
        "\u2581activation", "\u2581scripts", "\u2581constrain", Menu, "\u2581feed",
        "\u25813.5.1", "\u2581DATA", FRAME, "\u2581Field", lock, "\u2581Pickle", modal,
        "\u2581Scrape", "\u2581Di", ability, ted, creating, "\u2581Encoder", recomputed,
        "\u2581meaning", luck, wapping, "\u2581QAbstract", Table, Model, "\u2581QTableView",
        "\u2581MP", "\u2581compound", "\u2581Frames", "\u2581Median", "\u2581Module",
        "\u2581Bytes", sents, apabilities, loadtxt, repr, "\u2581Strat", Train, interest,
        bridge, QL, doc, "\u2581mess", "\u2581-*-", coding, "\u2581Struggl", "\u2581\
          refresh", "\u2581Remap", "\u2581Periodic", "\u2581Work", "\u2581strtod",
        "\u2581socks", "\u2581Black", ood, oo, insum, displayed, running, printable,
        mlin, "\u2581Cartesian", Equal, backends, "\u2581acros", magic, "\u2581expanding",
        DatetimeIndex, "\u2581Instance", Plot, "\u2581Processing", opt, optparse,
        SSLv, "\u2581encryption", OO, "\u2581gender", agent, "\u2581fileinput", "\u2581\
          decoded", "\u2581STATIC", URL, "\u2581Debugg", "\u2581popen", rc, reshape,
        "\u2581spe", sific, references, sphinx, "\u2581copyfile", "\u2581pprint",
        istinguish, skipping, loaded, processors, "\u2581inspect", ee, adjust, Excel,
        Writer, "\u2581Approximate", "\u2581Activat", "\u2581pyGTK", na, "\u2581interrupt",
        phone, "\u2581Process", "\u2581Letter", "\u2581pydot", TkAgg, "\u2581quotation",
        "\u2581boundary", "\u2581reordered", "\u2581Stock", Beta, "\u2581Dataframes",
        Common, "\u2581pi", tfall, "\u2581async", Provide, logger, "\u2581boundaries",
        "\u2581camel", .3.5, "\u2581dashes", Invoke, "\u2581others", "\u2581celery",
        retry, "\u2581skew", erous, disconnected, transformed, "\u2581Doctest", "\u2581\
          Inv", ol, "\u2581colorbars", "\u2581Permission", "\u258113", ahoo, "\u2581\
          Financ", "\u2581pathlib", "\u2581sides", "\u2581Deprec", "\u2581shrink",
        "\u2581keypress", "\u2581dependency", "\u2581Ensur", "\u2581dead", ask, trivial,
        double, "\u2581Broken", Pipe, "\u2581And", Categories, "\u2581contours", "\u2581\
          term", Japanese, xpath, "\u2581xticklabel", "\u2581Interpolate", "\u2581\
          Chain", HttpResponse, Permanent, "\u2581netcdf", Reverse, pairs, spaces,
        "\u2581writer", "\u2581quoting", protected, mb, lies, "\u2581Interface", "\u2581\
          Card", Locale, "\u2581mix", "\u2581xls", roll, "\u2581Drag", temporary,
        "\u2581VS", '2008', See, Event, "\u2581minimize", "\u2581shutil", "\u2581\
          Scrap", "\u2581chained", "\u2581slugif", "\u2581layer", Buckets, "\u2581\
          Sign", "\u2581termination", could, "\u2581collect", "\u2581equi", distan,
        "\u2581arc", votes, "\u2581summary", "\u2581statistics", "\u2581decorate",
        "\u2581arg", TLS, daptor, "\u2581decorators", "\u2581Factori", "\u2581imp",
        "\u2581paw", "\u2581paragraph", "\u2581Orange", rench, inancial, binned, Cyrillic,
        "\u2581EXIF", "\u2581mp", "\u2581struct", "\u2581collapse", LOAD, LOCAL, FILE,
        Bar, oracle, layout, permutations, "\u2581asynchronous", tile, integer, "\u2581\
          Forward", Should, "\u2581Define", "\u2581segment", Cycle, "\u2581indentation",
        printing, "\u2581Page", "\u2581Cygwin", "\u2581cyg", Graph, "\u2581Separa",
        "\u2581predictions", "\u2581RandomForest", equivalent, "\u2581redundan", cy,
        ufeff, There, "\u2581Flow", "\u2581development", query, "\u2581proto", buf,
        enough, screen, "\u2581portabl", "\u2581degree", "\u2581shortcut", "\u2581\
          management", "\u2581normalis", "\u2581matplot", ib, "\u2581Dummi", "\u2581\
          Authentication", "\u2581FacetGrid", "\u2581dateutil", "\u2581StringIO",
        "\u2581Meta", "\u2581exponentiation", gives, out, "\u2581negation", "\u2581\
          asymptote", discontinuit, "\u2581allocat", "\u2581Graphics", XMLRPC, Server,
        "\u2581merged", Char, "\u2581Checkbox", Pillow, "\u2581mod", testing, principal,
        "\u2581QPainter", Control, "\u2581periodically", "\u2581Intersect", "\u2581\
          calc", "\u2581explain", antt, hlines, "\u2581conj", argv, "\u2581Skip",
        rance, "\u2581listener", Relation, "\u2581composite", ikipedia, wiki, nomial,
        "\u2581Better", "\u2581IF", DISPLAY, into, "\u2581PythonMagick", "\u2581mkdir",
        "\u2581pisa", "\u2581Attributes", "\u2581past", '60', "\u2581lot", "\u2581\
          Blo", omb, erg, "\u2581rotat", lein, Upload, "\u2581doc", "\u2581eliminate",
        "\u2581PyDev", isibility, "\u2581Extend", "\u2581tur", tle, ysterious, "\u2581\
          disappear", "\u2581Duration", "\u2581Blog", "\u2581exce", "\u2581net", ities,
        "\u2581frozen", "\u2581prev", "\u2581lmplot", "\u2581facetgrid", "\u2581Bind",
        labels, "\u2581xtick", join, "\u2581intermediate", Clearing, soon, "\u2581\
          mut", "\u2581Integrat", piecewise, math, "\u2581uncompressed", adama, LIB,
        hundred, "\u2581OAuth", "\u2581Toolkit", "\u2581characteristics", MP, long,
        "\u2581filling", nickname, "\u2581formal", "\u2581AppEngine", "\u2581Half",
        tone, "\u2581ChromeDriver", "\u2581binding", rating, "\u2581Assert", "\u2581\
          mocked", crypt, "\u2581encrypt", "\u2581passwords", "\u2581odbcinst", "\u2581\
          Debug", "\u2581Tool", pause, frames, LoggerAdapter, "\u2581Trace", supervis,
        rich, let, "\u2581RequestFactory", Optimize, "\u2581cgi", "\u2581PyL", "\u2581\
          confused", "\u2581Override", "\u2581dispatch", Body, "\u2581problem", ur,
        atrices, '754', "\u2581velocity", "\u2581accelerat", Arbitrary, Which, "\u2581\
          viewset", "\u2581msg", "\u2581kwargs", Bee, "\u2581Decorat", "\u2581classmethod",
        "\u2581CTRL", "\u2581Launch", "\u2581win", "\u2581warning", "\u2581abbreviate",
        wsdl, "\u2581exif", tool, recursion, "\u2581Exact", "\u2581params", "\u2581\
          hang", contacts, "\u2581pika", "\u2581ioloop", comes, "\u2581Extra", "\u2581\
          expla", nation, timeit, "\u2581Swap", "\u2581WTForm", action, "\u2581readonly",
        "\u2581advance", "\u2581ply", spread, "\u2581inplace", runch, "\u2581ex",
        press, "\u2581hook", "\u2581rob", ust, ppearance, flat, nonzero, Tuple, "\u2581\
          bound", man, "\u2581linspace", "\u2581robot", caught, "\u2581Secure", Ctrl,
        perfectly, Handling, "\u2581failures", formed, sitemaps, "\u2581made", "\u2581\
          intersections", istic, "\u2581ngram", "\u2581prob", PoolExecutor, "\u2581\
          track", "\u2581breakpoints", "\u2581discre", ancy, JOIN, "\u2581underscore",
        "\u2581availabl", "\u2581singleton", "\u2581reportlab", stdin, ookahead, shoot,
        rior, Distribution, "\u2581pytest", "\u2581diff", FFI, "\u2581ellips", "\u2581\
          persistent", "\u2581unload", "\u2581Shuffl", ually, "\u2581TO", BCC, "\u2581\
          gree", "\u2581Grep", ible, ssion, Who, stablish, "\u2581score", "\u2581\
          Autoincrement", "\u2581normalized", eprecation, reading, mapping, "\u2581\
          Col", mdb, "\u2581Shar", Tuesday, Wednesday, "\u2581QTab", CheckBox, "\u2581\
          Asynchronous", "\u2581IronPython", "\u2581Crawl", Spider, "\u2581ImageField",
        "\u2581autoincrement", "\u2581reconnect", Jupyter, "\u2581EV", DOWN, "\u2581\
          prime", still, "\u2581metric", "\u2581Agglomerative", "\u2581clustering",
        buffer, finditer, gu, "\u2581QAbstractItem", AV, TS, "\u2581requirement",
        "\u2581frequencies", "\u2581angular", FL, ie, "\u2581prior", "\u258190", greyscale,
        "\u2581INI", serving, wget, isolation, het, gen, async, Native, "\u2581NoneType",
        quoted, "\u2581Scala", "\u2581Newton", VALUE, goes, "\u2581calendar", "\u2581\
          compatib", ility, ATCH, Robin, face, Binding, Saturday, "\u2581wildcards",
        "\u2581Compos", "\u2581checker", "\u2581peewee", '822', "\u2581cmd", "\u2581\
          blinking", "\u2581transl", Edward, "\u2581UserProfile", "\u2581introduce",
        oseconds, "\u2581replicat", "\u2581struggle", war, "\u2581Content", Type,
        "\u2581Mix", "\u2581fly", "\u2581marsh", allow, "\u2581YYYYMMDD", SS, rofessional,
        "\u2581practices", fortran, Valid, stype, "\u2581divider", lexible, "\u2581\
          wr", utorial, "\u2581zoom", NLTK, "\u2581SimpleCookie", "\u2581nonlocal",
        locator, were, RI, J, AE, '256', "\u2581explicit", "\u2581tuesdays", wednesday,
        "\u2581KeyError", "\u2581param", "\u2581bottom", Prompt, presentation, GBP,
        pound, win, event, socketio, explorer, Attempting, translated, gettext, lazy,
        UUID, lug, "\u2581endpoint", "\u2581rate", centered, Cost, "\u2581Monkey",
        ow, Rea, TLD, "\u2581DI", FFERE, NT, "\u2581Alternative", "\u2581Bea", Magic,
        Mock, "\u2581behave", DTD, endian, variant, "\u2581decimals", allocate, ids,
        "\u2581elevate", "\u2581privilege", "\u2581hexdigit", "\u2581summarize", Paginat,
        Document, Files, "\u2581SublimeREPL", "\u2581Dialog", builder, "\u2581SHA",
        RED, SEPARAT, specified, metavar, height, going, "\u2581controls", "\u2581\
          relationships", Spline, Even, "\u2581ManyToManyField", "\u2581mult", liques,
        "\u2581qchi", sq, "\u2581Plural", lack, "\u2581QVariant", "\u2581mimetype",
        WF, "\u2581needed", plo, nearest, "\u2581desc", "\u258140", EP, lt, "\u2581\
          TastyPie", psycopg, COPY, "\u2581vary", "\u2581modelform", "\u2581CPP",
        DEFINE, geometry, "\u2581spiders", spec, "\u2581SIG", PIPE, "\u2581Measur",
        duplicate, domains, "\u2581calls", "\u2581unescap", FTP, "\u2581Abstract",
        "\u2581Classes", pickleable, "\u2581PyYAML", "\u2581Interpret", xsrf, "\u2581\
          scene", "\u2581PYTHON", "\u2581pep", ter, wireframe, "\u2581RE", ABL, full,
        "\u2581transpos", legend, Allow, "\u2581prediction", "\u2581hot", upervisor,
        "\u2581len", ghts, "\u2581NICs", "\u2581Substitution", call, Root, Equation,
        ure, "\u2581Blob", Service, "\u2581tastypie", eg, tracing, "\u2581PY", ertain,
        lateral, That, "\u2581Your", Returned, "\u2581unstack", einsum, "\u2581cores",
        "\u2581controller", parameter, Hough, Circle, "\u2581Attempt", pool, UPnP,
        "\u2581ranking", onsecutive, "\u2581Timestamp", "\u2581Defer", only, "\u2581\
          Cleanly", Case, "\u2581subcommands", "\u2581placed", "\u2581Consisten",
        "\u2581Latin", "\u2581adjacency", "\u2581High", "\u2581clock", launch, "\u2581\
          spectr", "\u2581eye", fully, qualified, hanging, Virtual, Display, "\u2581\
          stale", advanced, setuptools, "\u2581exponent", exadecimal, "\u2581Scal",
        related, "\u2581Roll", "\u2581arithmetic", check, "\u2581Cancel", Choose,
        Dialog, "\u2581integral", "\u2581coordinate", Theta, XG, "\u2581bwt", een,
        "\u2581PATH", "\u2581standardize", "\u2581gp", graphml, phi, "\u2581Extrapolat",
        "\u2581english", "\u2581sns", "\u2581tempfile", mkdtemp, Conditions, "\u2581\
          iterative", Signal, "\u2581Interpreter", uck, legible, "\u2581Service",
        "\u2581slightly", NumPy, Wag, SC, AN, "\u2581roll", "\u2581Math", "\u2581\
          Second", MySQL, audio, Expecting, stack, "\u2581gl", Description, hantomjs,
        Failed, "\u2581UTM", "\u2581Lat", sent, "\u2581sleep", "\u2581pane", yntactic,
        Class, Attribute, rmtree, Access, denied, "\u2581meshgrid", "\u2581introspect",
        descriptor, stop, "\u2581logarithm", ave, "\u2581hull", "\u2581rotations",
        "\u2581filehandler", PN, Proxy, themselves, useful, rrd, ENUM, "\u2581subarray",
        unescaped, "\u2581violin", "\u2581vstack", "\u2581Stack", pi, "\u2581Catch",
        "\u2581Integrity", "\u2581dtypes", "\u2581listbox", Device, "\u2581projection",
        UIC, KLY, bullet, "\u2581threadsafe", visitors, FORTRAN, "\u2581Readonly",
        "\u2581formset", sterisk, fying, "\u2581twist", "\u2581Strange", "\u2581Manag",
        "\u2581chords", "\u2581reply", "\u2581kdeplot", peech, "\u2581taken", point,
        "\u2581captcha", +/-, "\u2581freeze", official, rw, multi, eground, Could,
        Expand, ri, "\u2581require", "\u2581Reload", Activate, "\u2581PyGame", kurtosis,
        collide, "\u2581DatetimeIndex", combine, White, sqlite, nearly, equal, "\u2581\
          partitions", "\u2581init", SH, fer, "\u2581evaluation", thrown, "\u2581\
          corrupt", "\u2581Angular", NOT, UNIQUE, mysql, WSGI, collectstatic, Refresh,
        djacency, "\u2581UCS", ffered, "\u2581bounding", node, "\u2581Dynamo", increment,
        "\u2581testbed", "\u2581tcp", alive, "\u2581cx", freeze, "\u2581poplib", client,
        "\u2581decision", merge, PDF, dist, "\u2581theano", "\u2581Fib", acci, prop,
        "\u2581argh", argparse, polynomials, "\u2581overcome", "\u2581Dask", "\u2581\
          visit", "\u2581Form", "\u2581locking", exceeded, Arg, "\u2581Diagram", really,
        "\u2581Hebrew", polyfit, "\u2581bytestring", "\u2581well", enumeration, "\u2581\
          noise", Protocol, "\u2581countries", "\u2581Basemap", "\u2581iteratively",
        price, "\u2581sheets", parsing, "\u2581European", "\u2581setUp", insort, "\u2581\
          PEP", '712', "\u2581Mongodb", "\u2581wm", "\u2581operate", dependenc, ent,
        Wait, "\u2581Solve", "\u2581charset", overflow, sure, PyQt, "\u2581QLabel",
        SUB, tic, pickling, "\u2581Stepp", nspect, "\u2581areas", Business, capture,
        Warnings, WITHOUT, "\u2581Safe", ConfigParser, "\u2581functionality", FUNCTION,
        "\u2581Mongo", BeautifulSoup, codes, "\u2581proximity", pherical, aw, Cosine,
        Home, decide, headers, session, "\u2581Approximat", stderr, Got, ttempting,
        status, horizontal, kka, "\u2581actor", "\u2581chain", "\u2581sender", "\u2581\
          distutils", "\u2581Reportlab", ADO, Ex, IP, "\u2581SOL", "\u2581conv", capitaliz,
        "\u2581Go", "\u2581opened", nullable, "\u2581userprofile", REMAINDER, interactively,
        "\u2581Coroutine", Fl, ick, RPC, "\u2581bright", "\u2581analog", "\u2581fmin",
        "\u2581tf", while, "\u2581Video", book, "\u2581eigenvector", plus, "\u2581\
          clicks", "\u2581reduc", "\u2581Ask", Machine, normal, "\u2581Unpickling",
        "\u2581setter", SequenceMatcher, "\u2581PCA", Gray, eird, "\u2581regions",
        ker, "\u2581wide", each, "\u25813.0", "\u2581mpi", run, Zeppelin, We, stern,
        Sh, ear, Joined, "\u2581consume", FUL, "\u2581gamm", "\u2581Indent", "\u2581\
          linebreaks", "\u2581recipients", Randomly, "\u2581manytomany", "\u258180",
        "\u2581included", "\u2581gz", "\u2581thick", "\u2581secret", save, "\u2581\
          attempt", "\u2581guess", encoding, setLevel, "\u2581MySql", "\u2581actions",
        "\u2581col", "\u2581Connector", messagebox, '192', Hz, cmp, .7.1, idle, "\u2581\
          optimizer", incognito, xternal, "\u2581STDIN", OUT, "\u2581parallelize",
        "\u2581nose", "\u2581Initialis", Wik, Diff, Change, Clipboard, "\u2581Compute",
        hood, "\u2581division", distribut, DBC, white, esides, "\u2581Channel", "\u2581\
          channels", Uniform, "\u2581TeX", "\u2581polygons", "\u2581Mock", Five, Per,
        tinent, Information, Closing, plicated, "\u2581Combobox", partial, "\u2581\
          transport", "\u2581Raising", "\u2581ValidationError", "\u2581Too", xls,
        Grooveshar, playlists, "\u2581shut", "\u2581Poi", "\u2581statsmodels", "\u2581\
          Odoo", "\u2581Overwrit", "\u2581Folder", Already, Exists, Joy, "\u2581disconnect",
        connected, "\u2581timing", ok, "\u2581eclipse", "\u2581printer", "\u2581Bundl",
        LU, "\u2581weekends", "\u2581straight", ordinate, mis, "\u2581'__", "\u2581\
          IPv", "\u2581basis", ultivariate, "\u2581Normal", "\u2581callbacks", virt,
        EM, "\u2581mim", correctly, Dropbox, "\u2581Public", "\u2581Arguments", "\u2581\
          dendrogram", mk, "\u2581serializer", "\u2581getpass", kit, "\u2581raster",
        "\u2581Vector", "\u2581Scalar", Kruskal, Wallis, "\u2581optimization", "\u2581\
          PYTHONPATH", "\u2581describe", MessageBox, hint, "\u2581satisfie", "\u2581\
          peak", "\u2581gpu", "\u2581algebra", docx, called, "\u2581middleware", Credit,
        "\u2581basicConfig", "\u2581Zoom", arrangement, "\u2581palette", "\u2581Pyparsing",
        "\u2581reserve", equality, "\u2581doctest", package, "\u2581subfolders", "\u2581\
          Serializer", "\u2581disallow", flu, "\u2581needle", "\u2581solution", Only,
        Mozilla, et, te, "\u2581suggest", "\u2581deque", RIMA, "\u2581XLS", daemon,
        "\u2581sheet", "\u2581workbook", "\u2581attrib", Win, "\u2581Wrap", "\u2581\
          irregular", "\u2581factorization", "\u2581Masked", ROC, update, "\u2581\
          Mako", Stamp, "\u2581Subclass", manage, matplot, Stopping, "\u2581ThreadPool",
        Optimized, "\u2581Thr", "\u2581centroid", notify, Outlook, "\u2581Vi", "\u2581\
          Predicti", compose, usual, "\u2581Anaconda", DE, modbus, "\u2581alignment",
        matrices, future, "\u2581Site", "\u2581SystemExit", exit, "\u2581pronounce",
        elm, "\u2581Mayavi", quality, "\u2581Mat", ters, "\u2581continuing", "\u2581\
          temporari", "\u2581Wrappe", Mixin, "\u2581Setup", rot, accident, "\u2581\
          usecols", "\u2581beta", "\u2581convex", defects, udoku, Highlight, early,
        "\u2581Simultaneous", "\u2581simulation", ix, "\u2581art", "\u2581QtGui",
        QListWidget, "\u2581learn", ma, "\u2581Detection", South, "\u2581timeouts",
        "\u2581Logistic", "\u2581Regression", lustering, lay, "\u2581factory", cloud,
        "\u2581ordereddict", segment, minima, Beans, talk, determine, "\u2581ml",
        divide, staff, "\u2581vim", XSD, "\u2581Pin", "\u2581Slope", "\u2581jQuery",
        "\u2581predict", Delegate, "\u2581bitvector", lin, Maximize, "\u2581Gauss",
        Legend, "\u2581grou", "\u2581interpolat", "\u2581quickest", "\u2581Primes",
        Future, "\u2581Issues", "\u2581keystroke", "\u2581residual", ^2, "\u2581monotonic",
        Schedule, commands, "\u2581TextEdit", "\u2581Compil", Killing, "\u2581schedule",
        "\u2581multithreading", sublime, "\u2581spring", "\u2581attempted", ease,
        "\u2581resizable", "\u2581CountVectorizer", "\u2581ngrams", "\u2581BaseHTTP",
        RequestHandler, "\u2581Pairings", nnerHTML, implify, reversal, "\u2581Theano",
        "\u2581Complete", "\u2581DEBUG", "\u2581tap", "\u2581idiom", "\u2581paragraphs",
        "\u2581cap", tu, terability, use, sense, 09-01, '00:00:00', "\u2581'2016",
        Core, tability, mpp, Development, "\u2581Constructor", "\u2581chaining", "\u2581\
          kalman", valid, lost, "\u2581redraw", "\u2581Simulate", smarte, "\u2581\
          serializers", "\u2581QNetwork", pylons, "\u2581paste", "\u2581OSError",
        Scikit, regression, "\u2581hashes", "\u2581Classify", restore, "\u2581Sampl",
        tslib, Timestamp, Protection, "\u2581bigram", Parser, "\u2581partially", tele,
        "\u2581bot", "\u2581PYD", Freeze, "\u2581assertRaises", "\u2581Boost", "\u2581\
          editing", "\u2581Pari", tition, PI, inheritance, "\u2581Emulat", "\u2581\
          lm", Template, LOB, EPL, Validator, "\u2581bell", "\u2581ortho", gonal,
        "\u2581plane", CLI, getattribute, "\u2581underscores", "\u2581removal", location,
        "\u2581QV", BoxLayout, Before, "\u2581Commit", uiver, ernary, Minimum, "\u2581\
          autotools", NotFound, Greater, uptime, "\u2581Connection", They, "\u2581\
          Fortran", might, urmur, Hash, setattr, spyder, "\u2581QTableWidget", Spacing,
        cont, "\u2581MAC", "\u2581Dis", crete, "\u2581Delaunay", Triangulation, "\u2581\
          xy", "\u2581warping", "\u2581morph", "\u2581controlle", "\u2581leg", "\u2581\
          Out", side, "\u2581subparser", "\u2581Paths", mesh, "\u2581realtime", ractical,
        "\u2581Polymorphism", "\u2581Verb", spawned, "\u2581constrained", "\u2581\
          DRY", made, '6.4', "\u2581Link", "\u2581Shared", "\u2581Recursion", etuptools,
        "\u2581develop", Learn, "\u2581condensed", "\u2581Facet", catch, "\u2581report",
        "\u2581pairplot", "\u2581lasagne", rsync, "\u2581annotation", "\u2581Semantic",
        "\u2581Wordnet", "\u2581polymorphism", insert, abbe, availability, del, bz,
        VL, effect, OOP, td, Immutable, ifficult, ouseMove, "\u2581MousePress", "\u2581\
          silent", TreeWidgetItem, Tags, lineEdit, ushButton, "\u2581maze", iling,
        Int, Collect, necessary, "\u2581Deep", "\u2581Stri", larification, "\u2581\
          Activation", "\u2581SparkContex", Cursor, "\u2581completely", "\u2581na",
        "\u2581Tree", "\u2581Virtualenv", always, boardInterrupt, "\u2581skel", eton,
        werkzeug, "\u2581extens", "\u2581elapsed", "\u2581detach", memory, ntialias,
        olin, "\u2581repeats", "\u2581remember", '*****', "\u2581Endpoints", "\u2581\
          fcntl", "\u2581Track", "\u2581Glob", Variable, closing, "\u2581lzma", "\u2581\
          Audio", fficiency, "\u2581asarray", "\u2581trust", "\u2581significance",
        Unnamed, PDB, "\u2581Injecti", Methods, orrent, "\u2581Client", "\u2581Peer",
        Tracker, "\u2581functools", lru, cache, "\u2581Github", hook, "\u2581Optimiz",
        atel, "\u2581catalog", ListCtrl, Linux, aws, "\u2581Pan", adas, "\u2581visual",
        ontiguous, Flask, "\u2581MU", ffic, "\u2581CString", font, pdfgen, xlsm, "\u2581\
          instruction", "\u2581execfile", "\u2581converter", Threaded, beaker, identity,
        "\u2581Improve", translate, "\u2581cutoff", "\u2581nosetests", argmin, find,
        "\u2581respond", mlcharrefreplace, "\u2581urlfetch", AC, "\u2581elevation",
        proxy, decompression, "\u2581Cyc", "\u2581guarantee", Loop, ept, went, "\u2581\
          pytables", Encrypted, Website, "\u2581thr", Formatted, "\u2581yy", Popup,
        "\u2581pen", proportional, "\u2581Enum", HTML, ntities, Line, Simplest, Sleep,
        copy, luetooth, trained, "\u2581embedding", vec, "\u2581future", deepcopy,
        "\u2581stock", "\u2581nb", digitize, "\u2581dummy", bmp, cover, iterparse,
        "\u2581dictConfig", "\u2581QtWebKit", DJANGO, ogram, PySide, "\u2581300",
        PF, coerce, "\u2581Explo", down, "\u25811.8.", minimum, "\u2581constraints",
        placement, "\u2581geo", artopy, PubMed, "\u2581Gaussian", "\u2581Eliminati",
        iteritems, access, "\u2581cents", "\u2581dollars", "\u2581uri", magemagik,
        PIL, File, scope, rad, ient, uppe, Testing, "\u2581workflow", timer, erator,
        wt, "\u2581Adjust", "\u2581med", filt, mapped, tabula, hist, kde, "\u2581\
          diviso", "\u2581modifier", "\u2581alt", "\u2581Patch", engine, "\u2581confirm",
        argmax, alone, Complete, Thread, "\u2581organiz", ToOneField, "\u2581weights",
        cnn, "\u2581dice", poll, JS, migrate, lashes, "\u2581matlib", FAILURE, TEMPLATE,
        room, Inconsistent, stroke, serve, arrow, Bring, "\u2581youtube", "\u2581\
          roles", "\u2581Pack", "\u2581Partial", "\u2581AJAX", dont, ul, extreme,
        wide, revision, SVN, epository, TimeStamp, "\u2581emacs", WebApp, "\u2581\
          Handler", "\u2581Implementation", "\u2581ranks", ikelihood, "\u2581estimate",
        RT, fly, gramma, "\u2581fibo", head, "\u2581inject", processing, storage,
        "\u2581predefined", "\u2581trees", "\u2581Animation", Treeview, "\u2581Christ",
        mas, "\u2581AssertionError", "\u2581sl", "\u2581OL", AP, "\u2581Randomiz",
        ourier, /*, exicographical, titcher, "\u2581mat", loadmat, shortcut, tel,
        eat, "\u2581startup", "\u2581registr", erivative, "\u2581Performance", dupes,
        "\u2581Cas", "\u25811.2", hortener, "\u2581harmon", incorrect, "\u2581zeroes",
        Look, "\u2581Project", "\u2581analyzer", lookup, ration, dense, "\u2581Generali",
        xtreme, EV, Likelihood, "\u2581fitted", "\u2581classify", Include, "\u2581\
          hierarchi", inidom, token, edu, neighbour, "\u2581Proxy", cut, aml, CPUs,
        "\u2581nest", "\u2581conflict", ane, "\u2581despi", "\u2581effort", Malt,
        Suite, "\u2581behav", isbn, "\u2581signature", Shift, depth, HOW, "\u2581\
          Pycharm", "\u2581rendered", Will, queen, "\u2581uni", decode, administration,
        "\u2581Pad", equently, "\u2581saturation", Mem, "\u2581Picture", "\u2581processed",
        "\u2581PyOpenGL", GNU, "\u2581Octa", "\u2581killed", hoosh, "\u2581vocabular",
        "\u2581significan", "\u2581oldest", "\u2581Resolv", "\u2581Mu", "\u2581Sigma",
        agging, "\u2581Ctypes", logistic, "\u2581httplib", ru, "\u2581expose", "\u2581\
          ProcessPool", crosses, Memory, UploadedFile, "\u2581cwd", "\u2581tri", rivers,
        Volume, "\u2581Docstring", Phantom, synchron, "\u2581Trick", que, "\u2581\
          violinplot", "\u2581IOError", "\u2581chosen", Socket, "\u2581uncertaint",
        "\u2581activate", "\u2581uint", recieved, PY, "\u2581wtforms", Sequence, CM,
        "\u2581differentiat", "\u2581webserver", "\u2581Restrict", self, "\u2581ArgumentParser",
        "\u2581summation", "\u2581Docker", numerical, "\u2581gravit", "\u2581particle",
        "\u2581spir", spa, "\u2581heap", "\u2581description", "\u2581footprint", tually,
        eam, "\u2581submit", "\u2581organization", okay, "\u2581emitte", "\u2581gif",
        "\u2581Wand", "\u2581say", "\u2581incremental", "\u2581programatically", "\u2581\
          ras", qt, drop, TreeView, equipment, span, "\u2581enforc", "\u2581enums",
        "\u2581instantiated", KDE, TWO, "\u2581confus", phan, "\u2581blobs", "\u2581\
          GIF", "\u2581Factory", Boy, "\u2581Export", "\u2581exceed", "\u2581indicators",
        login, generate, iter, "\u2581Interact", precomputed, "\u2581protect", "\u2581\
          programmer", "\u2581relie", ho, mq, unless, "\u2581crash", "\u2581Angle",
        "\u2581func", tor, "\u2581earth", "\u2581LD", LIBRARY, PATH, "\u2581scip",
        Pointer, mako, Features, "\u2581reg", edit, uncaught, "\u258110000", '12:30',
        pm, XMLHttpRequest, "\u2581happens", "\u2581deletion", idirectional, "\u2581\
          association", scheduler, "\u2581retain", "\u2581interp", "\u2581Asy", chronous,
        "\u2581Pickl", +=, "\u2581xmlrpclib", "\u2581metadata", "\u2581Downsampl",
        vel, weighted, "\u2581glade", Build, our, latitude, longitude, "\u2581filesystem",
        hibit, screensaver, "\u2581observer", uclidean, "\u2581Record", Scale, urn,
        autoload, flection, "\u2581discover", Graphviz, "\u2581clique", "\u2581destroy",
        initialised, "\u2581paired", "\u2581dbus", How, "\u2581Statistics", "\u2581\
          Subplot", Xml, "\u2581Simulat", nearby, rduino, motion, "\u2581pylint",
        Po, "\u2581caps", vtk, "\u2581Cast", "\u2581bcrypt", pyder, Pdf, ary, "\u2581\
          Inherit", "\u2581Metaclass", ship, tenanc, "\u2581geode", uzzle, "\u2581\
          AF", TER, isolated, requests, Very, "\u2581blueprints", "\u2581simplejson",
        Strategy, "\u2581Unbound", "\u2581para", "\u2581migrations", hg, "\u2581card",
        declare, submitted, "\u2581Config", "\u2581el", ig, otification, Icon, added,
        Absolute, initiated, "\u2581Naive", "\u2581senti", "\u2581analysis", "\u2581\
          thumbnail", "\u2581eliminat", "\u2581entity", newline, "\u2581setdefault",
        imap, jection, green, "\u2581outlier", odbc, Login, ortfolio, balanc, "\u2581\
          band", mails, "\u2581yahoo", stepsize, "\u2581Estimat", "\u2581role", "\u2581\
          lazy", evaluate, ivity, "\u2581wa", ffle, "\u2581chess", bandpass, cpu,
        diagram, water, "\u2581accumulation", "\u2581train", Gene, Bitmap, ranges,
        "\u2581clipp", "\u2581Good", forward, editable, atric, ia, Trie, Trip, "\u2581\
          sec", "\u2581matshow", getattr, "\u2581Pare", "\u2581cyclic", "\u2581multithread",
        multiprocess, bie, "\u2581Poll", SetWinEventHook, interrupted, profiling,
        "\u2581estimat", "\u2581QueryDict", elt, "\u2581Brace", "\u2581soap", "\u2581\
          ampersand", eighted, ractal, "\u2581cities", "\u2581Euler", UPDATE, "\u2581\
          multiplicati", "\u2581spider", oronoi, esse, '24', "\u2581worksheet", "\u2581\
          St", "\u2581pywinauto", "\u2581contribution", uccessive, bytes, writing,
        "\u2581routes", "\u2581yet", "\u2581coo", unsupported, ident, "\u2581Wrapping",
        3-2, "\u2581Illustrator", "\u2581TEMPLATE", summary, target, Imag, loudfront,
        ModelChoiceField, "\u2581Login", "\u2581Appengine", library, ServerProxy,
        "\u2581caching", stopped, "\u2581EC", "\u2581heuristic", gain, privileges,
        throughout, illion, processes, "\u2581international", "\u2581simultaneous",
        vampire, "\u2581cohesive", "\u2581pyQT", ra, "\u2581tray", ER, Ignoring, "\u2581\
          pickled", Pho, shin, "\u2581iter", "\u2581nat", TextEdit, "\u2581truncated",
        "\u2581networks", "\u2581Interrupt", "\u2581flip", "\u2013", "\u2581workspace",
        "\u2581javadoc", media, "\u2581matplotl", "\u2581possibil", "\u2581ET", ag,
        Namespace, "\u2581attractor", "\u2581Contents", restful, "\u2581Hierarch",
        "\u2581bokeh", developer, assertFo, State, Exception, MDB, Microsoft, Enum,
        what, "\u2581Lock", "\u2581Lo", late, IF, helper, odd, air, "\u2581needs",
        "\u2581Unittest", paint, mpl, touch, "\u2581heav", "\u2581syscall", adiobutton,
        At, picker, intensive, "\u2581Analysis", noisy, "\u2581Jython", Tom, "\u2581\
          gmail", maketrans, "\u2581salt", "\u2581regexes", "\u2581le", ks, "\u2581\
          renderer", "\u2581adress", stopping, "\u2581ob", vious, "\u2581Alembic",
        "\u2581asyncore", Panel, "\u2581unpickl", onsolidat, treatment, medium, Or,
        "\u2581fine", crypto, "\u2581Swagger", watch, derived, ung, config, "\u2581\
          rollback", FI, "\u2581protocol", "\u2581generators", "\u2581serializing",
        "\u2581autocomplete", CookieJar, "\u2581tk", FileDialog, "\u2581Overload",
        "\u2581Localiz", Epoch, "\u2581tic", "\u2581Limiting", Exiting, "\u2581Butt",
        signal, butter, "\u2581MPI", chart, "\u2581ffmpeg", suspend, nn, "\u2581Floor",
        "\u2581Plan", "\u2581Edge", "\u2581fieldsets", Installing, "\u2581Intercept",
        "\u2581Ranges", "\u2581Example", ile, Over, finance, "\u2581Dead", "\u2581\
          wanted", Not, Remote, "\u2581zeromq", "\u2581troubl", "\u2581FOR", hamming,
        "\u2581Neural", "\u2581SaveAs", def, "\u2581PowerP", ivot, Pro, obfuscation,
        delta, Days, Network, Request, standalone, Manager, "\u2581bookmark", Delete,
        "\u2581QListWidget", "\u2581ri", Guess, "\u2581Game", CV, "\u2581advantage",
        "\u2581Affine", amp, "\u2581Dragging", Proto, ypal, JSON, "\u2581JsonResponse",
        "\u2581QLineEdit", hashable, "\u2581cmp", "\u2581loads", "\u2581bools", "\u2581\
          uniform", "\u2581Dispatch", every, art, crop, space, TRUNCATE, TABLE, "\u2581\
          Cycl", reached, "\u2581charac", TextView, TextBuffer, "\u2581Publisher",
        ubscriber, ubyte, lectric, getter, One, underscore, animate, "\u25813.4.",
        "\u2581Ho", tter, older, "\u2581recognition", Perspective, correction, "\u2581\
          thin", south, "\u2581augment", "\u2581Argument", DFS, desk, May, "\u2581\
          whoosh", "\u2581Font", "\u2581tkMessageBox", eigh, resume, Markdown, "\u2581\
          cython", docs, "\u2581distribute", "\u2581Header", Parse, scaling, foreign,
        smooth, queryset, context, "\u2581UDF", logarithmic, "\u2581ensur", scraping,
        "\u2581ConfigParse", About, verti, olicy, Captcha, CUDA, "\u2581Package",
        "\u2581classifications", "\u2581im", resize, "\u2581Segment", "\u2581Raise",
        "\u2581crawling", Events, "\u2581touching", ellipse, "\u2581Replicati", supplie,
        GET, Since, illegal, "\u2581Cach", Gecko, ake, angl, After, Concatenation,
        "\u2581xyz", coefficients, ntrospect, "\u2581WSDL", rect, "\u2581upgrade",
        web, layer, eural, Declare, "\u2581Memory", Gram, AT, "\u2581tile", "\u2581\
          Pairs", "\u2581Idle", "\u2581Timeout", culation, assembl, "\u2581SimpleHTTP",
        "\u2581NUL", Agg, team, ithout, eval, tries, "\u2581broker", "\u2581BaseHTTPServer",
        multiplication, "\u2581negat", "\u2581signup", land, Timeout, Some, Async,
        Worker, "\u2581dy", uniform, "\u2581Numer", cial, "\u2581prefetch", "\u2581\
          Readabl", "\u2581chr", "\u2581completion", question, timezone, sanity, excel,
        Spring, Press, "\u2581Deserializ", memcache, "\u2581SFTP", Client, questions,
        "\u2581cla", himself, "\u2581gettext", preference, Parsing, "\u2581succes",
        alt, "\u2581Properties", liers, "\u2581Visi", "\u2581Silen", "\u2581core",
        Erase, sweep, "\u2581Declarative", "\u2581enabl", secure, ecognition, "\u2581\
          OCR", alchemy, ==, "\u2581eigen", behaviour, "\u2581Cmd", '18', lang, neo,
        em, "\u2581combobox", ghost, "\u2581DRF", "\u2581ModelSerializer", "\u2581\
          Http", spectral, "\u2581phase", Restful, "\u2581covariance", lative, omparative,
        "\u2581adjectives", "\u2581pk", term, "\u2581exponents", "\u2581country",
        "\u2581city", Brain, "\u2581Alternat", KF, counter, splash, pieces, "\u2581\
          ModelView", "\u2581stuff", collect, arbage, Weekday, git, DTR, "\u2581pyserial",
        CDF, UNIX, US, GAE, Adj, unified, diff, hardware, "\u2581rng", "\u2581Hachoir",
        "\u2581pySerial", numbers, Dataset, Exceed, eibull, "\u2581stub", "\u2581\
          lex", ubsub, "\u2581land", tp, "\u2581UUID", uint, Input, cms, ciphers,
        linked, "\u2581CellRenderer", Toggle, "\u2581inconsistent", aborted, FOLDER,
        SIGTERM, Version, "\u2581loo", "\u2581graphics", maintenance, rule, "\u2581\
          Task", "\u2581Lexic", "\u2581PROXY", "\u2581ask", "\u2581OSX", locations,
        "\u2581tqdm", ties, "\u2581GDAL", reserved, "\u2581symmetr", "\u258136", "\u2581\
          touch", pty, "\u2581griddata", APT, CHA, "\u2581pic", "\u2581Linked", ked,
        "\u2581Discover", "\u2581Gst", Pb, utils, occurrence, tearDown, sharing, "\u2581\
          ndimage", puzzled, di, "\u2581astro", "\u2581birthday", "\u2581calcul",
        "\u2581flash", ast, pie, degree, GV, "\u2581Pas", Interval, "\u2581DOC", TYPE,
        ignore, 'NO', ME, "\u2581notification", Reloading, Bad, '405', terminated,
        DATETIME, "\u2581Lazy", Spark, ue, ens, interpolate, "\u2581extrapolate",
        "\u2581Browser", expand, "\u2581tra", NameError, But, ancestor, "\u2581song",
        method, "\u2581Hover", Tool, "\u2581quaternion", "\u2581reindex", semaphore,
        Paint, "\u2581dynami", ctrl, foreignkey, combinations, Screen, memmap, "\u2581\
          suite", "\u2581Above", "\u2581updated", "\u2581po", OAuth, sycopg, flake,
        sliding, olymorphic, "\u2581holiday", "\u2581Solv", "\u2581Relationship",
        "\u2581recv", "\u2581setattr", logout, "\u2581formated", "\u2581MemoryError",
        "\u2581INFO", wrap, "\u2581Support", Height, ahalanobis, "\u2581stats", "\u2581\
          repo", "\u2581TestSuite", duced, "\u2581subgraph", "\u2581ModelAdmins",
        views, recommendation, school, Id, deviation, "\u2581GCD", "\u2581spot", etach,
        "\u2581pyc", die, "\u2581overrid", ifar, "\u2581ModelAdmin", Continu, ously,
        IFS, "\u2581IDs", "\u2581shelve", "\u2581posts", dk, "\u2581wrapper", "\u2581\
          differen", ciate, subdomains, KW, allet, "\u2581labeled", "\u2581WX", "\u2581\
          Func", Animation, ew, ntegral, Intensity, "\u2581ContentType", "\u2581Relations",
        "\u2581RadioSelect", "\u2581mime", computing, HH, "\u2581forests", DT, disk,
        destination, "\u2581Sane", preferably, Formsets, "\u2581Direct", labor, '22',
        ollapse, Just, "\u2581ocean", USB, blueprint, '?', Timer, Overlapp, dozen,
        ll, "\u2581Photo", "\u2581FAST", "\u2581measure", "\u2581music", nexistent,
        Form, syncdb, "\u2581sug", lexer, PS, "\u2581General", "\u2581translation",
        embeded, "\u2581bytestream", "\u2581containers", "\u2581Drive", Tokeniz, "\u2581\
          Apple", argspec, erkzeug, "\u2581informati", alman, Filter, "\u2581BOT",
        "\u2581Transfer", mousePressEvent, rtific, "\u2581specification", "\u2581\
          integrat", mock, "\u2581effects", isco, unexpected, "\u2581fulfill", ights,
        "\u2581Init", "\u2581parenthetic", "\u2581consistent", "\u2581equa", authorize,
        "\u2581incrementally", "\u2581coefficient", DES, "\u2581Place", "\u2581QListView",
        click, "\u2581Traits", UI, "\u2581TreeView", adaptor, Power, Point, tan, "\u2581\
          automatical", "\u2581Serve", Recommende, Cameras, "\u2581Android", "\u2581\
          xkcd", "\u2581retrieved", reStructuredText, wait, "\u2581crawl", spider,
        "\u2581perspective", carp, "\u2581Matl", pot, mo, summarise, actual, extent,
        excepthook, "\u2581Geo", metric, streamer, "\u2581Expla", "\u2581Encrypt",
        "\u2581PyCrypto", populate, WTForms, "\u2581HSV", "\u2581Fuzzy", "\u2581scores",
        MAPI, "\u2581Joint", leading, "\u2581weekday", ecting, "\u2581communicat",
        amplitude, scraper, Choice, "\u2581XPATH", "\u2581money", "\u2581ISODate",
        nohup, decimal, Object, RTF, "\u2581GPU", "\u2581normalization", Qtconsole,
        do, dbapi, paginated, quick, "\u2581Curl", December, "\u25812013", "\u2581\
          Optimis", erfect, Pickle, ua, "\u2581presorted", "\u2581RaspberryP", "\u2581\
          sftp", indention, "\u0301", RO, Tastypie, "\u2581tensordot", FS, "\u2581\
          mro", "\u2581pixmap", "\u2581bcolz", "\u2581ctable", urlretrieve, unconverted,
        '128', Scheme, shift, ottl, "\u2581Multiplicati", CSV, Shutdown, Performing,
        massive, iterable, USD, JPY, "\u2581Youtube", runserver, precationWarning,
        indian, Internet, upply, rate, Tab, cal, "\u2581mechani", Down, atch, mbiguous,
        Admin, "\u2581Simplify", "\u2581copied", prime, "\u2581equivalenc", emmatize,
        "\u2581lemmatize", EU, quiz, IO, Separated, IntegerField, optimize, '509',
        Up, otherwise, "\u2581sandbox", runner, "\u2581Wi", Fi, fork, nk, "\u2581\
          retries", "\u2581RSA", topic, phonemes, deprecated, Also, "\u2581references",
        Meaning, "\u2581hand", "\u2581Decorator", "\u2581Nearest", deactivate, overwrite,
        Ho, Encoder, CDATA, mat, provide, ncorporate, "\u2581pc", "\u2581packed",
        '30,000', "\u2581SUDS", dupefilter, Nic, Develop, "\u2581equivalency", "\u2581\
          speech", "\u2581expir", "\u2581badly", rough, weakref, "\u2581Migrat", Weak,
        "\u2581boost", Message, MacOS, pdflatex, ike, kype, ListView, "\u2581Ansible",
        "\u2581family", oker, "\u2581scann", partit, "\u2581mutate", continuations,
        keystrokes, "\xB0", "\u2581deserialize", RLS, "\u2581AccessToken", Forward,
        For, Digital, "\u2581cropp", "\u2581details", dv, ComboBox, proach, "\u2581\
          Person", Organization, agger, nytime, alembic, migration, octave, nclusion,
        CREATE, imag, Notebook, closure, nt, Upper, CASE, Points, Logged, "\u2581\
          2007", "\u2581Templat", ensitivity, "\u2581disc", "\u2581photo", "\u2581\
          su", "\u2581prefixes", "\u2581lat", lon, Tex, Info, intensity, Send, "\u2581\
          untar", Either, "\u2581Thai", "\u2581thickness", requirements, "\u2581BOTO",
        SQS, "\u2581expensive", Solr, corner, "\u2581logo", "\u2581pil", 'ON', CA,
        tornado, Largest, "\u2581weak", tina, FF, "\u2581Validat", basketball, "\u2581\
          readlines", member, rapping, Nothing, "\u2581invite", "\u2581flow", signin,
        "\u2581Grow", Travis, require, store, formset, "\u2581PyInstaller", vertex,
        lphabetical, "\u2581encodings", symmetric, Association, "\u25811.3", "\u2581\
          stemm", assemble, "\u2581Resource", "\u2581receiver", "\u2581modern", peaks,
        "\u2581serialized", visible, be, arian, "\u2581Timezone", Modification, "\u2581\
          Tur", "\u2581lifetime", currence, Maybe, mon, "\u2581mk", gpx, "\u2581GitPython",
        "\u2581automat", models, ini, "\u2581urlparse", "\u2581testsuite", "\u2581\
          testcases", Keras, Persistence, yYAML, ipv, "\u2581article", "\u2581capacity",
        By, "\u2581Hook", Alchemy, ods, "\u2581collat", Failure, Mon, Serving, lex,
        ibility, "\u2581surviv", "\u2581Rational", "\u2581naming", "\u2581Smart",
        xtFile, kill, tables, "\u2581car", "\u2581noun", Ruby, '|=', Selenium, PhantomJs,
        "\u2581uwsgi", "\u2581Mutable", "\u2581Giv", ealth, "\u2581enemy", light,
        spline, "\u2581HOG", "\u2581ws", "\u2581opt", Enable, "\u2581powerset", deserializ,
        "\u2581Customiz", super, entry, raven, Net, "\u2581invok", Open, "\u25815.5",
        "\u2581lose", "\u2581factors", ndroid, "\u2581movement", Derive, contact,
        pick, "\u2581converge", barchart, yield, Layer, "\u2581inconsistenc", XXXX,
        Wrapper, "\u2581GC", build, stenci, "\u2581Storage", "\u2581abs", "\u2581\
          PyOpenSSL", RL, subplot, "\u2581lifecycle", "\u2581migrat", "\u2581Positive",
        "\u2581Eff", cient, Pear, Rest, Framework, "\u2581samples", "\u2581libclang",
        RNN, "\u2581censor", "\u2581Enumerat", csrf, "\u2581sk", flow, "\u2581descen",
        "\u2581packag", REST, resource, global, SPN, adoop, Cell, apt, "\u2581MULTI",
        PLE, "\u2581Autobahn", BaseClass, SubClass, "\u2581anagrams", oauth, duct,
        irc, "\u2581xmltodict", NSI, vim, packages, "\u2581QR", qr, ibpy, Forge, "\u2581\
          glyphs", "\u2581Reg", "\u2581factories", kew, emporaryFile, ARRAY, Related,
        Sniff, "\u2581Trap", "\u2581truncat", cow, Standard, "\u2581Style", PASSWORD,
        HASHERS, "\u2581branch", "\u2581shapely", "\u2581rdf", "\u2581rdflib", ql,
        "\u2581React", "\u2581Gulp", wildcards, "\u2581caus", generator, "\u2581Persist",
        "\u2581gen", task, Anne, "\u2581leftmost", initialization, "\u2581establish",
        "\u2581millions", insertion, "\u2581Combinatori", cs, coverage, sysfs, wind,
        crabble, "\u2581finder", CONSTANT, "\u2581skips", mkdir, "\u2581Bucket", Priority,
        Queue, SOME, "\u2581populat", zoom, Mandel, "\u2581jointplot", journal, wi,
        "\u2581perfect", stylesheet, RAI, "\u2581efficiency", AML, ibbo, Compressing,
        wave, "\u258179", "\u2581arctan", "\u03C0", Through, pidgin, week, "\u2581\
          OneToOneField", Lost, syncio, Origin, tifulsoup, Bucket, "\u2581lisp", "\u2581\
          dns", rawler, "\u2581IM", "\u2581pysmb", sam, "\u2581hashli", "\u2581comparable",
        ug, "\u2581mistake", "\u2581repr", "\u2581pagination", "\u2581directives",
        "\u2581comprehen", "\u2581Media", IT, "\u2581classification", askell, "\u2581\
          Life", '404', "\u2581Compa", opping, "\u2581Tesse", Cap, Identity, tz, inf,
        Data, "\u2581multidimension", "\u2581PyObj", xgboost, '00,000', MQ, "\u2581\
          multigraph", grant, "\u2581quad", thor, letters, icrosecond, collation,
        "\u2581convolve", invoked, "\u2581setuptools", "\u2581algo", egg, redirect,
        manager, ock, ref, "\u2581theore", tical, ROUTER, "\u2581mu", RGBA, ipython,
        ide, LDAP, "\u2581bundle", Subject, Usage, GW, "\u2581cols", Bay, networkx,
        authentication, "\u2581dig", swig, "\u2581interpola", "\u2581swapped", "\u2581\
          interesting", lade, Source, "\u2581movie", Frames, MQTT, "\u2581Oauth",
        ami, "\u2581tr", "\u2581progressbar", '301', low, NN, internals, diomatic,
        "\u2581nextSibling", Simple, Being, exc, GED, COM, German, exposed, "\u2581\
          26", "\u2581Rules", "\u2581arity", "\u2581POP", involve, away, "\u2581SES",
        "\u2581Postgresql", Initialization, Starred, "\u2581Defini", "\u2581recalculate",
        orough, types, django, rank, lmost, "\u2581Spli", "\u2581Arch", "\u2581mnist",
        "\u2581850", "\u2581Gui", ob, "\u2581Travers", "\u2581Ba", Welc, "\u03BC",
        miles, km, '**2', physic, AR, neg, "\u2581Flexible", "\u2581fixture", Sizer,
        "\u2581tested", sister, GZIP, "\u2581Callable", saying, Tele, "\u2581Bot",
        priv, Exclud, LINK, "\u2581Waterma", Egg, static, repl, bound, "\u2581extrapolat",
        DLL, "\u2581STDOUT", omatic, "\u2581Rewrit", covered, feedback, Must, "\u2581\
          polyfit", "\u2581cert", Buffer, Assembly, Monthly, least, Category, "\u2581\
          Share", subprocess, serial, "\u2581puzzle", sp, "\u2581trial", "\u2581Expos",
        "\u2581Tabular", Dragon, append, Dictionary, recursive, star, tkinter, STDERR,
        "\u25CF", "\u2581globals", Header, "\u2581sector", ependency, TFS, cleanse,
        Github, Stream, lassification, "\u2581sniff", removable, "\u2581Bur", Wheel,
        MAT, ering, SI, lc, "\u2581bias", "\u2581coin", ropagati, stropy, "\u2581\
          JPG", Schema, Mean, boy, dead, pending, thernet, CS, gap, "\u2581moderate",
        quadratic, me, never, "\u2581clon", terparse, "\u2581Splinter", OTO, "\u2581\
          Analytics", "\u2581grequests", "\u2581Disabled", arshal, Colour, hack, "\u2581\
          Shaped", decoration, OrderedDict, third, UN, ontextMenu, CAT, "\u2581Overplot",
        lab, EE, "\u2581collision", "\u2581ImageSurface", "\u2581filtr", Cloud, "\u2581\
          Org", "\u2581Authenticat", "\u2581Cha", co, "\u2581Myster", "\u2581RDF",
        XML, calling, itioning, relations, SQLAL, chem, "\u2581Matches", notes, ano,
        "\u2581pyinstaller", probable, "\u2581SQLITE", fifteen, Rock, Paper, "\u2581\
          Scissors", "\u2581izip", longest, mpf, Waiting, tasks, "\u2581obfuscat",
        "\u2581waste", "\u2581Child", "\u2581Nodes", "\u2581firewall", colour, "\u2581\
          cli", "\u2581freezes", Pika, "\u2581memset", "\u2581peek", iadd, extern,
        Own, "\u2581interruptable", bits, "\u2581singular", "\u2581QPixmap", cosine,
        "\u2581PyPy", "\u2581Truncat", "\u2581doxygen", "\u2581leads", ordinal, "\u2581\
          subsequen", "\u2581ssl", "\u2581Piece", '1251', TextCtrl, robots, corr,
        record, Enumeration, "\u2581explained", "\u2581Push", yourself, Eventlet,
        Analysis, meters, "\u2581ScrolledWindow", fr, "\u2581OpenSSL", viridis, eginner,
        "\u258110.7", funny, "\u2581res", "\u2581sol", "\u2581spatial", "\u2581Iterator",
        Optimal, Sentence, "\u2581Saniti", normalize, "\u2581piece", mad, erception,
        Matrix, "\u2581temp", 2-3, Address, produce, "\u2581Delimit", FreeTDS, mer,
        ium, "\u2581logout", cdef, Low, Language, Credentials, ight, corpora, enumerate,
        "\u2581seen", raft, riangle, Camera, github, "\u2581contribute", "\u2581Expir",
        toolbar, GridLayout, "\u2581rhyme", CMYK, "\u2581templat", primes, tesseract,
        "\u2581pow", mework, tooltip, sigma, "\u2581tfidf", "\u2581Frequen", connect,
        "\u2581choos", "\u2581'1,2,", "\u2581competit", scoring, CAST, till, Selected,
        "\u2581FIFO", correlate, Style, roubleshoot, processor, Irreversible, "\u2581\
          outcomes", CT, "\u2581constellation", dl, nditer, "\u2581probabilit", rk,
        histogram, concer, east, "\u2581ImageDraw", VEN, ntheses, iscussion, dude,
        Windowed, deep, ToString, "\u2581QMainWindow", but, mro, "\u2581successive",
        Riak, "\u2581mlab", terable, Undefined, Local, ROUND, HA, SN, Storage, utagen,
        LR, New, Small, "\u2581FIn", Cluster, MA, "\u2581derefer", enter, spatial,
        Delaunay, "\u2581endless", pagination, "\u2581Hierarchical", orner, Rect,
        terminat, "\u2581necessar", Delivery, active, "\u2581Lex", agno, "\u2581unshorten",
        gnome, Mercurial, "\u2581quantlib", REGEX, Swig, "\u2581altered", expect,
        ctl, "\u2581GeoDjango", "\u2581walk", abundant, deficient, Kernel, "\u2581\
          48", "\u25811.1", tools, btex, calculate, tumbl, "\u2581255", inventory,
        bo, "\u2581Openpyxl", "\u2581Symbol", "\u2581wallpaper", accounts, "\u2581\
          omit", teria, "\u2581spherical", hints, bac, "\u2581freez", "\u2581Sample",
        eni, "\u2581Eigen", rolling, "\u2581organi", "\u2581halo", '7.3', postgres,
        sheet, urtosis, "\u2581wild", po, "\u2581followers", "\u2581Twython", "\u2581\
          situation", "\u2581Scope", eviation, reader, "\u2581Lxml", Dock, central,
        bidden, fruit, "\u2581measurement", then, "\u2581involv", DateTimeField, qual,
        PR, "\u2581Graceful", DEC, torial, mega, pypi, "\u2581XlsxWriter", DEFAULT,
        "\u2581shebang", finally, bear, "\u2581seek", "\u2581Transcrypt", "\u2581\
          DOM", Bus, teardown, pict, "\u2581gensim", "\u2581Floo", magick, Eggs, Subclass,
        Factory, "\u2581Location", Hard, Quantile, "\u2581vectoriz", conversations,
        ferred, Measure, eeting, itations, "\u2581Emacs", "\u2581pseudocolor", xterm,
        icense, "\u2581Plate", Conflict, "\u2581PeriodIndex", birthdate, ibberish,
        "\u2581POS", "\u2581Generat", Available, Streak, established, "\u2581pyximport",
        Editor, PL, CONN, heap, startswith, tagged, quotes, "\u2581subscribe", installation,
        Reassigning, "\u2581balanced", mg, Latitude, Longitude, importance, "\u2581\
          Inconsisten", RANSAC, Cookbook, Reporting, "\u2581ZipFile", isect, aspx,
        "\u2581fd", how, Session, Like, "\u2581currenc", ology, dark, lient, prepared,
        SQ, pitch, Translate, used, NODE, LAY, Profiling, GIS, ops, "\u2581Produc",
        UserCreationForm, "\u2581configparser", setup, "\u2581synthesize", Metadata,
        "\u2581MIMEImage", PyObject, "\u2581consumer", right, "\u2581blog", Constrain,
        ram, mono, roc, ruste, Records, density, "\u2581Paralleliz", Extended, "\u2581\
          vari", dialog, "\u2581roots", "\u2581divisor", ap, top, avatar, NCE, factory,
        aries, "\u2581Descriptors", "\u2581conditionals", statement, "\u2581void",
        "\u2581palindrom", SU, cascade, "\u2581kv", absolutely, mplement, "\u2581\
          visited", over, attach, decompos, recall, fatal, work, Processes, bases,
        ir, "\u2581unzipp", "\u2581Principal", "\u2581Anonymous", TA, Fizz, uzz, "\u2581\
          kNN", "\u2581cookielib", orem, cycling, Street, Map, "\u2581SIGALRM", '70',
        "\u2581src", ArcGIS, directories, Med, OPTIONS, playlist, ruby, send, standard,
        summaries, relevant, ython, Connection, "\u2581Dropzone", undo, nam, rlang,
        rq, SVR, SV, "\u2581DET", Let, Offset, night, '366', ptr, utm, ran, iProt,
        sentences, Edit, humbnail, inv, "\u2581minimi", Flags, "\u2581Scapy", Application,
        "\u2581ArgParse", her, TIFF, "\u2581FormField", extend, "\u2581pump", eli,
        "\u2581ban", "\u2581rowspan", lk, Wrong, vsync, pop, lat, Daily, tif, "\u2581\
          rang", Robot, "\u2581giga", ttachment, Lower, Deferred, "\u2581seventh",
        Sitemap, "\u2581recogni", staticfiles, "\u2581Install", ctypes, hance, "\u2581\
          fillvalue", "\u2581MIME", "\u2581heapq", Full, "\u2581dotted", "\u2581lstrip",
        "\u2581benchmark", Hyperlink, asp, ebian, sizeof, lambdify, processed, Router,
        manipulation, "\u2581Tornad", predicate, loom, dden, har, cts, "\u2581PA",
        cl, ypothesis, ailchimp, translations, pat, chop, MAP, interpreter, RAW, "\u2581\
          400", "\u2581analyse", "\u2581QTreeWidget", "\u2581disassembl", CMS, "\u2581\
          concat", "\u2581dat", missing, Short, Cause, "\u2581Purpose", ARY, '512',
        interp, tation, Require, '+6', '+9', "\u2581wpa", handshake, errno, circ,
        "\u2581Advanc", pproach, "\u2581Perfo", schedule, repeat, "\u2581250", met,
        formatting, "\u2581SetEn", customize, "\u2581punch", ffi, half, FILES, Retry,
        "\u2581yticks", lv, dat, contents, erlin, eep, rename, Adobe, RGB, further,
        lank, "\u2581Dea", "\u2581pdfminer", "\u2581GridSearch", phem, Group, Trial,
        "\u2581emit", child, "\u2581WS", REF, USE, chmod, ES, "\u2581et", Batch, vectors,
        "\u2581evaluat", wrapper, define, "\xA1", "\xA7", Read, "\u2581gdb", '27',
        SyntaxError, writable, encod, "\u2581ast", ord, Skipping, "\u2581avg", vision,
        "\u2581MIMEText", Properties, comb, minus, "\u2581simplifi", because, "\u2581\
          hsv", "\u2581regplot", He, ieve, implementation, ography, Step, Increase,
        "\u2581Mathemat", someone, enc, eaky, once, "\u2581greeting", curve, Com,
        inspect, svn, QT, accurate, "\u2581EX", CE, "\u2581Definin", "\u2581strategies",
        "\u2581architectur", flags, pages, Page, "\u2581corr", coef, myself, copyright,
        Background, actor, EI, "\u2581centre", Andrew, Raised, "\u2581assembly", Topic,
        dropbox, "\u2581paginate", pair, "\u2581cl", "\u2581license", plate, Price,
        "\u2581reliab", lum, VB, Capture, compressor, "\u2581Eva", interaction, lagged,
        Host, uppercase, Dispatch, occurs, stocks, "\u2581Yield", secs, properly,
        channel, Audio, Instance, Za, decent, Scrapy, Mesh, Wave, Cache, "\u258155",
        '45', Memmap, mag, '033', msi, Option, olat, Drive, "\u2581gdal", tiff, efinitely,
        lamb, "\u2581Compile", Prefix, Asia, Drop, Visit, passwd, mu, ped, Role, Need,
        Surpris, "\u2581ms", fd, ROOT, psilon, vectorize, purchase, "\u2581rebuild",
        SelectMultiple, "\u2581nginx", camelCase, Feedback, pyc, "\u2581PDFMiner",
        Expire, og, plugin, "\u2581mpl", DV, cv, 0184, jpeg, LOW, extension, "\u2581\
          itertuples", Authentication, average, logged, "\u2581urlpatterns", "\u2581\
          Profile", "\u2581Memoiz", oggy, ffect, ength, card, basic, tablename, hard,
        see, tiny, Store, variables, FileName, return, Slow, "\u2581Crypto", Random,
        wireless, lemma, sums, alogue, "\u258176", exchange, cu, oob, "\u2581Tesseract",
        ASKPASS, final, "\u2581Worksheet", alternative, partition, CAPS, collapsed,
        fresh, larity, Reduc, efficiency, completion, "\u2581Struct", ramiko, cur,
        ari, interactivity, Disposition, "\u2581111", "\u2581effi", iciently, "\u2581\
          SM", dataset, message, ought, frequency, "\u2581Deriv", failure, udf, "\u2581\
          withColumn", Qu, bi, FG, Calculator, SIO, istry, "\u2581seq", Release, istinct,
        powerlaw, Density, "\u2581savez", gamma, Stem, Russia, Love, "\u2581ANT",
        Music, progress, "\u2581octave", "\u2581Dense", concordance, USA, tk, Hamming,
        "\u2581Cipher", "\u2581GdkPixbuf", "\u2581unwrap", flush, browse, "\u2581\
          Classifi", short, utilities, Closest, Policy, weights, completed, Loader,
        PYTHONHOME, Select, <unk>]
      sentencepiece_vocab: false
      vocab_file: null
  trg_embedder: !SimpleWordEmbedder
    emb_dim: 128
    fix_norm: null
    param_init: !Ref {default: 1928437192847, name: null, path: exp_global.param_init}
    src_reader: !Ref {default: 1928437192847, name: null, path: model.src_reader}
    trg_reader: !Ref {default: 1928437192847, name: null, path: model.trg_reader}
    vocab: null
    vocab_size: 12741
    weight_noise: 0.0
    word_dropout: 0.0
    xnmt_subcol_name: SimpleWordEmbedder.ec3b28cd
  trg_reader: !PlainTextReader
    output_proc: []
    read_sent_len: false
    vocab: !Vocab
      i2w: [<s>, </s>, "\u2581sorted", "\u2581(", "\u2581lst", "\u2581,", "\u2581\
          key", "\u2581=", "\u2581lambda", "\u2581x", "\u2581:", "\u2581-", "\u25811",
        "\u2581*", "\u2581c", "\u2581", '[', "\u2581]", "\u2581.", "\u2581index",
        "\u2581)", "\u2581max", "\u2581len", "\u2581str", "\u2581for", "\u2581in",
        "\u2581line", "\u2581zip", "\u2581foo", "\u2581df", Country, "\u2581value",
        _, counts, "\u2581reset", index, "\u2581name", "\u2581'", Sum, '#', SPACE,
        of, Accidents, '''', "\u2581data", "\u2581set", Date, "\u2581diff", "\u2581a",
        "\u2581update", "\u25813", "\u25814", "\u25812", "\u2581groupby", group, value,
        "\u2581rank", ascending, "\u2581False", "\u2581datetime", "\u2581strptime",
        Tue, ',#', '22', Nov, '2011', '06:00:00', GMT, "\u2581'%", a, '#%', d, b,
        Y, H, ':%', M, S, Z, "\u2581struct", "\u2581pack", "\u2581'<", I, "\u2581\
          16", '338', '3792', '4', "\u2581list", "\u2581append", foo, "\u2581insert",
        "\u25810", "\u2581the", set, "\u2581k", "\u2581lower", dict, "\u2581\"\"\"\
          {", s, ':', '{', c, '}', ^, n, '}}"""', "\u2581format", "\u2581s", dog,
        "\u2581n", "\u25815", x, isinstance, "\u2581dict", "\u2581pair", "\u2581d",
        "\u2581L", "\u2581items", "\u2581v", "\u2581}", "\u2581sort", values, Peak,
        Weeks, "\u2581True", "\u2581inplace", "\u2581eval", "\u2581\"", print, (',
        Hello, ''')"', A, C, B, D, "\u2581itertools", "\u2581product", Item, Code,
        '1961', '1962', '1', '96', 3', "\u2581sum", "\u2581done", "\u2581el", "\u2581b",
        "\u2581numpy", "\u2581logical", not, "\u2581is", nan, "\u2581os", "\u2581\
          path", "\u2581join", "\u2581split", "\u2581sep", "\u2581replace", ;, "\u2581\
          ':'", "\u2581subprocess", "\u2581call", tar, my, dir, '#|#', md, '5', sum,
        "\u2581shell", "\u2581\"\"\"", '437', '2', 123""", "\u2581decode", hex, "\u2581\
          User", fields, "\u2581if", "\u2581required", "\u2581ix", "\u2581map", "\u2581\
          int", "\u2581i", "\u2581driver", "\u2581find", element, by, css, selector,
        input, onclick, '*=''1', Bedroom, Deluxe, ''']"', "\u2581re", "\u2581sub",
        "\u2581'[^", '-', zA, 0-9, '*.', ']''', "\u2581my", string, "\u2581web", browser,
        "\u2581open", file, ':///', pdf, ., "\u2581result", "\u2581'\\\\", "\u2581\
          '-'", NaN, "\u2581now", "\u2581date", "\u2581elem", "\u2581tag", "\u2581\
          iter", "\u2581not", 2.7.0, bf, fd, '7034', '54', '"""', language, '!=',
        en, "\u2581all", "\u2581==", "\u2581your", "\u2581values", "\u2581pivot",
        table, "\u2581rows", X, "\u2581cols", 2', "\u2581try", "\u2581#", NEW, LINE,
        IN, DENT, "\u2581doSomething", "\u2581except", "\u2581pass", "\u2581Exception",
        "\u2581M", "\u2581axis", "\u2581time", "\u2581mk", time, "\u2581dt", tuple,
        "\u2581+", "\u2581microsecond", "\u2581/", "\u25811000000.0", <=, column,
        '&', "\u2581y", "\u2581itemgetter", "\u2581l", list, to, sort, "\u2581np",
        "\u2581arg", where, "\u2581arr", "\u2581loc", one, two, "\u2581hashtag", "\u2581\
          findall", '#(\\', w, +)', "\u2581UNICODE", "\u2581rename", "\u2581src",
        "\u2581dst", "\u2581print", "\u2581etree", "\u2581tostring", "\u2581some",
        tag, strong, "\u2581json", "\u2581dumps", "\u2581soup", "\u2581BeautifulSoup",
        "\u2581response", "\u2581read", utf, -8', "\u2581remove", "\u2581filename",
        "\u2581min", "\u2581num", "\u2581>", prod, type, responsive, "\u2581<", "\u2581\
          six", month, "\u2581today", "\u2581relativedelta", "\u2581months", "\u25816",
        "\u25812010", "\u258112", "\u258131", "\u2581timedelta", "\u2581365", isoformat,
        things, "\u2581keys", weight, "\u2581reverse", "\u2581arange", "\u2581fn",
        "\u2581','", "\u2581'./", urls, eu, csv, "\u2581range", "\u2581100", "\u2581\
          10", "\u258120", "\u2581\"\"\"\"\"\"", isdigit, t, +', as, "\u2581r", strip,
        "\u2581'\\", "\u2581T", test, '#"""', "\u2581strip", "\u2581lstrip", Mac,
        EOL, \, r, Windows, ',', '6}', \\, "\u2581text", "\u2581X", "\u2581j", "\xD0",
        "\u2044", "\xD0\xB0\xD1\x80\xD0", o, "\xD0\xB0", "\u2581encode", latin, 1',
        "\u2581shift", "\u2581fillna", cumsum, "\u2581urllib", "\u2581request", urlretrieve,
        http, '://', search, twitter, com, /, json, '?', q, '=', hi, "\u2581where",
        "\u2581sys", "\u2581stdout", "\u2581flush", "\u2581__", str, __, "\u2581operator",
        "\u2581count", "\u2581conv", "\u2581method", ffill, "\u2581config", "\u2581\
          state", DISABLE, "\u2581ord", "\u2581string", "\u2581arrays", "\u2581\"\"\
          \"{:,", '}"""', "\u2581locale", locale, LC, ALL, US, '255', '000', "\u2581\
          grouping", "\u2581Col", "\u2581isin", men, rock, mount, in, "\u0440\u0430\
          \u0437", "\u0434\u0432\u0430", "\u0442\u0440\u0438", "\u2581MyModel", "\u2581\
          objects", "\u2581extra", "\u2581select", length, Length, (, name, )', "\u2581\
          order", "\u2581dicts", "\u2581abs", "\u25811.7", '76', '72', '95', '59',
        '75', ratio, pixels, "\u2581m", '~', "\u2581mask", "\u2581formula", "\u2581\
          matrix", "\u2581vstack", "\u2581meshgrid", p, "\u2581z", "\u2581reshape",
        "\u2581browser", elements, xpath, "\u2581\"//*[", '@', =', submit, ''']/',
        '"', "\u2581get", attribute, "\u2581with", example, yaml, "\u2581as", "\u2581\
          stream", "\u2581yaml", "\u2581load", "\u2581YAML", Error, "\u2581exc", "\u2581\
          pd", "\u2581DataFrame", "\u2581columns", "\u2581args", ort, "\u2581unique",
        "\u2581strftime", -%, m, "\u2581parse", "\u2581quote", plus, characters, like,
        these, ':$', '=?', '%', Q, ^$, "\u2581myList", "\u25819", www, google, br,
        8', parser, monkey, '2010-07-32', love, banana, "\u2581fuzzy", 20/01/1980,
        10/01/1980, ':3', ':4', "\u2581search", count, Name, City, "\u2581size", "\u2581\
          '[^0-9]", sdkj, h, '9', '87978', asd, 098, 09, '80', '98', ID, "\u2581head",
        "\u2581url", "\u2581somestring", "\u2581simplejson", ',%', "\u2581%", Jun,
        '200', 5#, '1:', '33', PM, "\u2581parser", Aug, '28', '999', '#12:0', '0',
        AM, "\u2581abspath", "\u2581exist", GDB, Path, "\u2581dirname", "\u2581requests",
        "\u2581post", bin, org, post, che, ers, link, "\u258111", "\u258117", df,
        grade, stype, "\u2581float", lk, line, earth, "\u2581'0'", "\u2581permutations",
        "\u2581compile", "\u2581'^(.+)", '(?:\\', '|\\', '?)', '((?:', +)+), "\u2581\
          MULTI", '((?:\\', path, python, '2.', py, need, edArgumetGoHere, "\u2581\
          final", choices, "\u2581another", choice, getcwd, "\u2581real", "\u2581\
          dir", "\u2581cwd", "\u2581full", "\u2581shutil", "\u2581copy", txt, "\u2581\
          choice", "\u2581ascii", uppercase, "\u2581seq", gdp, log, text, "\u2581\
          li", sex, Female, Male, W, Words, words, .', "\u2581match", "\u2581'(",
        '.*?[.?!]', +, ), '{0,', '})''', "\u2581phrase", "\u2581group", "\u2581'((\\\
          \\", )\\, '*)''', "\u2581OrderedDict", fromkeys, "\u2581file", endswith,
        "\u2581'/'", "\u2581input", "\u2581item", "\u2581fh", "\u2581seek", new, "\u2581\
          setdefault", encoding, "\u2581'[\\\\", u, 0600-, '06', FF, ']+''', "\u2581t",
        "\u2581minute", Apple, American, "\u2581dropna", "\u2581subset", three, four,
        five, "\u2581how", all, "\u2581flat", nonzero, "\u2581mean", just, date, dates,
        '*', "\u2581from", "\u2581functools", "\u2581import", "\u2581reduce", "\u2581\"\
          \"\"{0:,", f, "\u258124", '32', '2.34', function, "\u2581**", myfile, "\u2581\
          def", "\u2581buf", "\u2581f", "\u2581lines", size, "\u25811024", "\u2581\
          while", +=, "\u2581return", "\u2581round", '23.45678', "\u2581Y", "\u2581\
          isocalendar", "\u2581iloc", "\u258115", "\u258150", dummy, "\u2581agg",
        returns, "\u2581ftp", "\u2581retr", binary, RETR, "\u2581write", "\u2581urlfetch",
        "\u2581fetch", deadline, "\u258160", "\u2581legend", numpoints, loadtxt, rb,
        "\u2581delimiter", "\u2581skip", rows, "\u2581Sample", "\u2581filter", range,
        "\u2581'2011-01-0", '2011-01-31', year, 01', spam, ham, "\u2581apply", along,
        axis, "\u2581linalg", "\u2581norm", your, escape, "\u2581fig", inches, "\u2581w",
        "\u2581h", "\u2581forward", hello, there, (5), "\u2581'5'", you, "\u2581example",
        "\u2581results", "\u2581test", data, "\u2581utcnow", U, -16-, le, "\u2581\
          io", "\u2581encoding", "\u2581merge", inner, "\u2581on", user, id, "\u2581\
          shape", "\u2581N", "\u2581enumerate", '3', "\u2581unpack", L, y, "\xCC\xA6\
          \xBB", "\u2581powerset", abcd, 'true', "\u2581'1'", 'yes', yea, up, certain,
        ly, hu, go, /', "\u2581plt", "\u2581savefig", svg, myArray, modules, "\u2581\
          ax", "\u2581xaxis", ticks, position, top, "\u2581cursor", "\u2581execute",
        INSERT, OR, REPLACE, INTO, master, SELECT, '#*#', FROM, '][', ']*\\', '-]*$',
        "\u2581'!", deadbeef, "\u2581'0", xa, "\u2581hex", String, Value, is, '#"',
        "\u2581'\"'", '#"{}"', "\u2581tags", "\u2581|", "\u2581help", "\u2581upper",
        unicode, "\u2581'2'", "\u2581'3'", "\u2581href", \\., iwashere, "\u2581'^(?!",
        '(?:[', 0-9+., ']*', '|', //, ))', java, jar, Blender, '#(', '`', 1`, )#,
        VALUES, '#(%', $', "\u2581suffix", ',''', '[^\\', "\u2581db", "\u2581engine",
        sql, here, '>''', "\u2581exit", "\u2581getattr", object, "\u2581None", number,
        "\u2581cla", "\u2581total", "\u2581bin", P, place, code, "\u2581word", "\u2581\
          '([", aeiou, '])', ':((', '][^', ']*)', '{3})', "\u2581'\\\\1\\\\", "\u2581\
          loads", "\u2581'{\"", '":', '#42', bar, baz, '"}''', "\u2581array", comments,
        "\u2581any", "\u2581e", lestring, lelist, "\u2581plot", col, _1', "\u2581\
          style", "\u2581parsed", html, "\u2581html", "\u2581body", div, "\u2581attrs",
        class, container, "\u2581page", urlopen, "\u2581figure", figsize, "\u2581\
          translate", "\u2581punctuation", "\u2581base", '64', "\u2581urlsafe", decode,
        uenc, ascii, "\u2581123", "\u2581br", form, "\u2581nr", codecs, sample, '-8',
        sig, "\u2581server", "\u2581smtplib", "\u2581SMTP", smtp, gmail, '587', "\u2581\
          '{:08", '}''', "\u2581letter", "\u2581number", "\u2581session", "\u2581\
          query", "\u2581Task", spent, "\u2581hours", "\u2581system", ms, build, project,
        ln, Configuration, Debug, MyCount, source, bashrc, sh, opt, expand, aliases,
        nuke, script, "\u2581headers", WWW, Authenticate, Basic, realm, =", '"''',
        "\u2581del", mykey, "\u2581'24052010", "\u2581'[^\\\\", 00-\\, '7', F, '(.+?)\\',
        "\u2581'44442", (2), 44', ')(?:', '[()]', '*\\2*', '*)*', "\u2581subplots",
        adjust, wspace, space, apple, cat, pear, fish, csvwriter, "\u2581writerow",
        "\u2581row", "\u2581'(?<=[", \\.\\, '?!]', "\xE2", '93', "\u2581variable",
        array, i, "\u2581sublist", "\u2581to", reverse, "\u2581'[^0-9", "\u2581'*'",
        ell, ']', or, ld, "\u2581'3", lu, v, z, me, "\u2581logging", "\u2581disable",
        CRITICAL, url, (%, Str, Obj, '#<', start, remove, '>#', end, "\u2581start",
        "\u2581end", 'null', dicts, "\u2581ast", "\u2581literal", eval, '1,2,3,4',
        List, "\u2581tuple", "\u2581user", "\u2581groups", Member, "\u2581exists",
        "\u2581getLogger", setLevel, "\u2581DEBUG", "\u258134.2", '424', "\u258164",
        '2344', "\u258176.", '3534', "\u258145.", graph, png, "\u2581dpi", "\u2581\
          1000", del, "\u2581p", "\u2581id", "\u2581exec", exec, Congress, "\u2581\
          do", mid, excel, "\u2581sheet", unhexlify, '40', '81637', ef, "\u2581unsorted",
        "\u2581presorted", "\u2581days", "\u2581feature", World, lo, ha, sdfasdf,
        cc, g, "\u258114", '*$', foobar, find, "\u2581\"//", option, '''"', "\u2581\
          click", "\u2581myfile", append, ed, cool, be, ans, '...''', ab, koko, '([\\',
        ']+|\\', '13.5', '*10', '-4', e, "\u4E00", fff, "\u2581Popen", rm, some, listofdict,
        bcd, fghjklmnpqrstvwx, CON, CERT, ATION, "\u2581IGNORE", CASE, "\u2581executable",
        label, "\u2581tick", "\u2581'2015/01/01", '12', am, /%, "\u2581img", "\u2581\
          Image", picture, jpg, "\u2581show", "\u2581I", mg, aa, '!#', errors, '!''',
        "\u2581ch", ':\\', Users, desktop, "\u2581no", integers, "\u2581mylist", "\u2581\
          tree", "\u2581xpath", "\u2581\".//", ()=', Example, "\u2581\"\"\",", "\u2581\
          '[\\", 00-\, "\xA3\u20AC\xA3\u20AC", "\xA3", '100', worth, more, than, "\u20AC",
        "\u2581\"{'", muffin, ':#', lol, kitty, '}"', cp, 1252', "\u2581mydict", '([^',
        isalpha, "\u2581first", "\u2581second", '0-9-]', "\u2581'{0:", "\u2581score",
        "\u2581g", '0,1,2', savetxt, "\u2581direct", output, "\u2581check", ls, T,
        V, 6', "\u258125", "\u2581car", manufacture, "\u2581chain", iterable, "\u2581\
          '(?", '^[^\\', nd, ^\\, "\u2581'\\\\(", '.*?\\)', "\u2581yourdata", key,
        subkey, "\u2581gca", lines, ydata, "\u2581A", "\u2581GET", username, "\u2581\
          pprint", "\u2581o", '''^$''', "\u2581include", "\u2581'^", item, textfile,
        dT, SZ, "\u2581pandas", terminat, longlong, TESTstringTEST, TEST, '?''', "\u2581\
          archive", "\u2581pdf", "\u2581basename", "\u2581reversed", OfTuples, "\u2581\
          List", "\u2581startswith", "\u2581'4'", 7', "\u2581'8'", "\u2581'9'", "\u2581\
          '(?<=\\\\", '!', '0,2', '(?=[', ']|$)', "\u2581scatter", "\u2581//", "\u2581\
          chr", "\u2581chosen", condition, "\u25810.005", '82', '81', '5859', "\u2581\
          timestamp", '1970', seconds, "\u2581modified", "\u2581bool", "\u2581last",
        "\u2581km", "\u2581fit", "\u2581words", "\u2581else", site, admin, panel,
        php, "\u2581parent", "\u2581and", chmod, "\u2581stat", "\u2581S", IR, USR,
        GRP, IROTH, "\u2581add", argument, "\u2581nargs", +\\, he, llo, '30', "\u2581\
          by", check, box, selected, N, AMPERSAND, APOSTROPHE, "\u2581cleaned", "\u2581\
          slice", slice, "\u2581func", "\u2581'{}{}", "\u2581val", "\u2581new", "\u2581\
          old", deepcopy, "\u2581frame", 'on', "\u2581\"\"\"\\\\", ud, '83', ude,
        '-16', surrogate, pass, "\u2581globals", myfunction, stackoverflow, "\u2581\
          conn", "\u2581httplib", "\u2581HTTPConnection", HEAD, response, "\u2581\
          status", "\u2581reason", "\u2581200", href, ^=, javascript, pickle, "\u2581\
          bar", "\u2581attr", "\u2581alpha", "\u2581findAll", width, '300', px, "\u2581\
          sql", "\u2581myDict", Result, vars, "\u2581'\\\\[(.*?)\\\\]", mystring,
        "\u2581'%.2", kg, '#=', '#%.2', l, al, "\u2581var", datetime, "\u2581Series",
        st, ng, "\u2581matplotlib", "\u2581rc", Params, font, "\u258122", DateValue,
        +\\.\\, Current, Level, '3.4', db, '?\\', +|\\, '-1', '3.2', '4.2', '#3''',
        "\u2581it", "\u2581js", obj, '6', '8', "\u2581app", "\u2581run", "\u2581debug",
        "\u2581drop", attr, "\u2581gmtime", mtime, superset, "\u2581wi", wordids,
        Total, cost, '#$', '{:,.', TotalAmount, prefix, "\u2581random", "\u2581'.*",
        follow, '\\?', page, .*', "\u2581country", "\u2581capital", Word, Split, ']{2}',
        "\u2581pat", "\u2581'^\\\\", '{1,3}', filename, "\u2581Tag", "\u2581distinct",
        tex, "\u2581delete", 1.0', "\u2581END", timestamp, myNumber, myscript, getter,
        anniversary, score, "\u2581type", "\u2581tf", "\u2581Session", "\u2581constant",
        cluster, "\u2581pattern", "\u2581factoriz", float, "\u2581C", "\u2581B", 0',
        '16', Sep, 2012', "\u2581Book", "\u2581pk", "\u2581create", '{0:.2', "\u2581\
          randint", '00000000000', "\u2581999999999999", "\u2581'%0.", "\u2581trial",
        "\u2581stdin", My, keywords, "\u2581host", "\u2581'192.168.", '0.5', "\u2581\
          port", '9000', "\xC5\xC4\xD6", UTF, "\u2581G", "\u2581'-(?!", bb, ')([^-]+)',
        "\u2581hand", resultType, "\u2581decimal", "\u2581Decimal", "\u2581rand",
        "\u258110000", "\u2581only", files, "\u2581filenames", "\u2581walk", "\u2581\
          extend", "\u2581break", "\u2581glob", "\u2581'/", home, adam, /*., directory,
        "\u2581cur", "\u2581executemany", "\u2581tup", "\u2581markdown", "\u2581output",
        format, 4', kit, TIME, ONE, Europe, Istanbul, "\u2581dates", "\u2581Article",
        pub, "\u2581annotate", "\u2581article", "\u2581Count", title, "\u2581canvas",
        R, AABB, "\u2581'2007-0", '04', ':08:', 12', "\u2581300", "\u2581communicate",
        mycmd, myarg, "\u2581PIPE", Python, Job, num, split, "\u2581^", "\u2581POST",
        "\u25817", The, strings, are, the, same, case, insensitive, awk, '10', '11',
        TAA, ATG, '{3})+', "\u258165", "\u2581concat", "\u2581ignore", "\u2581'1/1/201",
        "\u2581periods", "\u2581freq", https, ken, net, re, it, "\u2581verify", blah,
        "\u2581needle", haystack, substring, 'No', '!"', Found, .", "\u2581tail",
        CHAR, LENGTH, '254', regex, "\u2581'^.{", "\u2581font", Purisa, comma, char,
        "\u2581\"'\"", myVar, locals, "\u2581has", "\u2581obj", BBB, rgbstr, "\u2581\
          commit", outer, "\u2581setStyle", Sheet, QPushButton, background, color,
        DA, red, "\u2581D", Light, "\u2581hashli", "\u2581md", thecakeisalie, "\u2581\
          hexdig", est, folder, "\u2581birthday", "\u2581month", "\u2581day", "\u2581\
          td", Next, "\u2581tr", td, Bo, at, aaabcabccd, "\u2581dtypes", "\u2581object",
        "\u2581form", plain, somekey, someotherkey, somekeyggg, espeak, "\u2581stderr",
        "\u2581STDOUT", "\u2581linspace", "\u2581endpoint", dll, "\u2581Create", SymbolicLink,
        testdir, Link, "\u2581upload", "\u2581blobstore", upload, "\u2581gs", bucket,
        AB, "\u2581expand", "\u2581cmp", "\u2581ts", "\u2581marker", "\u2581repeat",
        "\u2581colorbar", "\u2581im", "\u2581Card", "\u2581myset", '.69', "\u2581\
          8.27", "\u2581'5", '1.', 5+6, "\u2581concatenate", "\u2581ravel", chapter,
        Desktop, head, first, "\u2581floats", "\u2581xticks", "\u2581fileinput", "\u2581\
          super", "\u2581In", struct, "\u2581self", init, "\u2581year", "\u2581level",
        std, bob, gold, write, "\u2581next", "\u2581treeview", "\u2581connect", allocate,
        changed, "\u2581'10", '05', "\u2581'\\\\\\\\", "\u2581proc", "\u2581container",
        "\u2581attribute", "\u2581'(?:", review, ')?(', /(\\, +)), very, Import, ant,
        "\u2581fname", "\u2581content", "\u2581readlines", '#{0}', how, do, Enter,
        "\u2581names", Region, "\u2581platform", (.*), "\u2581collection", "\u2581\
          '10'", "\u2581common", "\u2581substring", Number, Avg, "\u2581'^(", '(?:(?!',
        ).)*, "\u2581'\\\\1", Bull, '((.*?', '.*?)', '{1}', "\u2581partition", "\u2581\
          Counter", '<[^>]*>', "\u2581userprofile", level, gte, par, xxx, _1_, '"]',
        "\u2581thing", Please, enter, something, "\u25818", '77', "\u2581bbox", tight,
        male, Gender, "\u2581Year", "\u25812014", "\u2581nan", "\u2581argparse", "\u2581\
          ArgumentParser", "\u2581allow", abb, rev, Feature, "\u2581dic", "\u2581\
          gb", "\u2581'[%", '{0},', '#{1}', '#{2}', "\u2581\"\"\"{0", '}/{0.', day,
        section, select, "\u2581hash", tom, jerry, mouse, spark, stock, positions,
        "\u2581'='", headers, Cookie, cookie, "\u2581'{}_{}", "\u2581lists", "\u2581\
          equal", blabla, "\u2581mmap", fileno, "\u2581access", CCESS, READ, "\u2581\
          found", "\u2581combinations", '#{}', "\u2581win", sound, "\u2581Play", Sound,
        wav, "\u2581SND", FILENAME, "\u2581intersection", "\u2581'\\\\$", '0-9]+',
        '[^\\$]*', "\u2581'$", 'off', delicious, "\u2581importlib", module, "\u2581\
          class", comment, ']}"""', Markus, Close, Fisher, yscale, "\u2581non", pos,
        clip, distancesDF, datesDF, '])\\', block, "\u2581gzip", gz, rt, subset, "\u2581\
          char", "\u2581maketrans", dummies, '](?=[', ']))', "\u2581'\\\\1#", ex,
        "\xE1", mple, dirs, "\u2581formatter", "\u2581Formatter", "\u2581'%(", asctime,
        '%(', message, "\u2581'\"", (\\, '+),', +), "\u2581original", other, func,
        bash, "\u2581\"\"\"#", "\u2581'{0:0", dictionary, stack, implicitly, wait,
        "\u2581switch", frame, "\u2581'{%", "\u2581'14", ':0', '03', 08', '+(?:\\',
        '*,\\', +)*), "\u2581dictionary", order, map, rmdir, rmtree, error, '19',
        /2014, '765', "\u2581'20", <, 30', "\u2581\"\"\"{:.5", sparse, success, "\u2581\
          imp", os, "\u2581or", "\u2581xor", '*''', cdf, "\u2581instance", "\u2581\
          MyClass", "\u258129", "\u2581'>", students, "\u2581marks", $, answer, "\u2581\
          lin", solve, "\u2581Matrix", bigdict, '.*?\\', th, ac, we, "\u2581root",
        geometry, '500', '(?:', )+, "\u2581'{0:.", lt, "\u3042", "\u2581u", columnheading,
        cmd, Company, "\u2581workbook", "\u2581xlsxwriter", "\u2581Workbook", app,
        smth, 2/, E, xpense, '01', xlsx, ':/', Steve, Documents, demo, "\u2581pyplot",
        fontsize, small, "\u2581prop", "\u2581contains", ']"', doesn, this, mean,
        technically, works, '?"', "\xAB", ']*?)', "\xBB", "\u2581monthly", echo, EmployeeList,
        "\u2581reindex", myintegers, Executive, sequence, grep, stdout, six, "\u2581\
          close", tuples, k, "\u2581window", "\u2581Gtk", "\u2581Window", Position,
        CENTER, "\u2581'30'", "\u2581params", "\u2581unquote", "\u2581trace", "\u2581\
          email", queryresult, focus, ':''', "\u2581focus", get, "\u2581sample", Key,
        "\u2581description", raw, abcdefg, "\u2581Path", etc, password, does, exist,
        "\u2581writer", header, "\u2581\"\"\"0", 08, "\u25813652458", BB, "\u2581\
          '9", numbers, "\u2581Test", "\u2581actions", contains, fixed, "\u2581dot",
        application, left, state, mydata, '{}''', grouper, "\u2581transpose", BrandName,
        ABC, '#0', "\u2581'42", "\u2581nonzero", xticklabels, major, ticklabels, "\u2581\
          rotation", "\u258145", "\u2581Profile", put, ation, "\u2581flatten", "\u2581\
          users", MY, URI, Authorization, TOK, TOKEN, ',\\', world, '*?', bc, aabcc,
        "\u2581DOT", abcdabcva, mike, Abc, abc, def, DEF, "\u2581\"\"\"<", '>"""',
        '::', cls, clear, tc, own, "\u2581main", mp, 3""", avi, "\u2581'\\\\[[^\\\\\
          ]]*\\\\]|", '"[^"]*"|', "\u2581'\\\\$(", ']*)\\', '(.*?)\\$', sin, an, duck,
        "\u2581quadmesh", clim, vmin, max, genfromtxt, "\u2581header", "\u2581dtype",
        \\*, "\u2581lowercase", "\u2581length", colors, aeiouAEIOU, de, fg, '123',
        and, again, 123', "\u2581log", usr, var, "\u2581rel", "\u2581grouped", '},',
        welcome, john, len, 5', "\u2581pop", "\u2581KeyError", "\u2581color", '112233',
        '[^', ']+?', jvm, args, dynamic, otherparam, 'false', "\u2581'%.3", '5.3',
        "\u2581']'", ..', windows, '-1252', "\u2581'-0", '1110', "\u2581colour", "\u2581\
          kind", colour, "\u2581idx", "\u2581math", "\u2581ceil", myString, "\u2581\
          make", '3.', /2002, /07/, owl, Class, '07', '13', '26', '89', '563', Digit,
        '.0005', '.005', Cat, "\u2581info", =%, '={}', "\u2581connection", "\u2581\
          send", HTTP, /1.0, established, OK, "\u2581sqrt", "\u2581square", thisismylist,
        Age, "\u2581model", '#1''', '+(?:-\\', +)+, "\u2581'--", conf, "\u2581action",
        "\u2581strings", "\u2581'.*%", (.), '''12345''', Bob, has, "\u2581element",
        "\u2581ma", "\u2581tile", "\u2581cond", argmax, "\u2581ID", "\u2581na", '221',
        iso, -8859-1, "\u2581'(?<!\\\\", '{5}', '(?!\\', "\u2581cents", int, "\u2581\
          dollars", "\u2581'$'", while, "\u2581bad", chars, referer, "\u2581pylab",
        "\u2581ylim", "\u2581stack", "\u2581StringIO", "\u2581comment", nums, description,
        "\u2581'{'", '{0!', '}:{', "\u2581dct", "\u2581'}'", "\u2581parts", +""",
        ']*''', union, "\u2581union", "\u2581unicodedata", "\u2581category", button,
        taskkill, im, make, exe, "\u2581current", '])\\1', ffffffbbbbbbbqqq, ')([',
        markup, '>\\1</', display, columns, li, (.., polishpottery, ''')]"', factor,
        "\u2581lol", "\u2581fd", "\u2581O", WR, ONLY, CREAT, EXCL, Original, "\u2581\
          pickle", "\u2581dump", "\u2581outfile", Mar, ley, wikipedia, "\u2581cookies",
        "\u2581cookie", lib, "\xFF", PplNum, RoomNum, cumcount, "\u2581unstack", Child,
        "\u2581nodeValue", "\u2581thread", thread, "\u2581myfunction", MyStringHere,
        '])''', "\u2581para", "\u2581'\\\\[([^", '\\[\\]]+', pluto, '84', '*\\', tail,
        "\u2581raw", "\u2581'2009", '19:19:30', '-0400', "\u2581String", "\u2022",
        "\u2581zeros", "\u2581release", Day, old, bread, '50', sale, today, inf, Log,
        myapp, "\u2581destroy", "\u2581'0630", Andr, "\xC3\xA9", subdir, "\u2581'!'",
        "\u2581\"\"\"-", "\u25813.1415", "\u2581duplicated", "\u2581heapq", largest,
        "\u2581setp", xx, '#23', "\u2581elements", "\u2581diag", "\u2581rot", '90',
        '{2,}', "\u2581'|'", "\u25813.14159", '3.95', "\u2581\"\"\"{0:.", train, etRel,
        "\u2581dateutil", "\u2581'2013", '00', '17', '#+', 00', "\u2581mo", gr, ify,
        WHERE, Month, Fruit, "\u2581persons", passport, birth, info, "\u2581urlparse",
        frag, address, ext, "\u2581frozenset", "\u2581terminate", "\u2581ctypes",
        "\u2581windll", "\u2581MessageBox", '#\\', ']{2,}', "\u2581yourstring", '\\.[^.]+',
        "\u2581zipped", cr, Block, centroids, "\u2581URL", opener, "\u2581retrieve",
        random, wget, "\u2581download", "\xE9", "\xE3", dim, ddd, aaa, bbb, ccc, eee,
        This, series, kw, "\u2581wo", duplicates, sep, er, ated, O, '{}', -\\, "\u2581\"\
          \"\"{}", Test, next, '>', 27\\, Lib, generic, "\u2581st", img, '.*?>', Joe,
        Blow, "\u2581'(?=(\\\\", '73', '010', 111', "\u2581'01", '0010', 10', "\u2581\
          21", "\u2581'$\\\\", +$', "\u2581'\\\\((\\\\", +)\\), ushButton, "\u2581\
          functions", "\u2581wx", "\u2581TextCtrl", "\u2581imshow", "\u2581image",
        Array, "\u2581cmap", Greys, Pandas, mycsv, "\u2581csv", "\u2581structure",
        ST, NAME, COUNT, OP, "\u2581'21", 11/, '16:30', "\u2581\"\"\"{0:.{1}", '%}"""',
        "\u2581digits", "\u2581choices", "\u2581con", "\u2581Custom", K, meta, "\u2581\
          einsum", ji, ->, j, "\u2581version", '}}}', "\u25811000000000.0", variable,
        "\u2581force", "\u2581linebreaks", per, "\u2581directory", updated, None,
        Super, "\u2581nodes", "\u2581Node", "\u2581splitext", somefile, "\u2581pygame",
        "\u2581display", mode, FULLSCREEN, "\u2581'$%", times, '#10^{', '}$', '+20',
        tmp, January, '2010', "\u2581ValueError", "\u2581'(?=(", '.*?', ij, kj, mysite,
        "\u2581auth", pwd, "\u2581beginning", "\u2581quit", ignore, sutil, "\u2581\
          cpu", percent, "\u2581virtual", memory, "\u2581pid", pid, "\u2581py", "\u2581\
          Process", "\u2581memory", Use, "\u25812.0", "\u258130", Temp, tt, abcdef,
        "\u2581\"\"\"{0}", '#{1}"""', '}#', "\u2581ham", "\u2581changed", "\u2581\
          '{0}", ':<15}}{', '1}:<15}}{2}:<8}}', '{{2}}', quarter, "\u2581models",
        "\u2581ForeignKey", User, "\u2581'^([^", AA, ']|', )*$, "\u2581environ", HOME,
        KEY, THAT, IGHT, EXIST, env, "\u2581default", '1.5', "\u2581'.//", '(),',
        TEXT, '")', with, ()=", "\u2581outer", "\u2581transform", '.)(?=.', "\u2581\
          '(?<=", "\u2581collections", "\u2581most", common, "\u2581'(?:^|", "\u2581\
          par", "\u2581'(\\\\", fix, "\u2581'__", "\u2581res", "\u2581ip", elevations,
        "\u25810.1", "\u25810.05", "\u25810.2", "\u25810.4", "\u2581idxmax", '(.+?)(',
        (.+)\\, +)$, '34', 00\, '?\', '@@', '#(?,', '#?', '#?)', stats, "\u2581wait",
        01-, Jan, '-1995', "\u2581copyfile", ints, "\u2581multiply", radiation, tamb,
        firstname, "\u2581bucket", TR, DATE, "\u2581accumulat", "\u2581'2013-1-25",
        nth, "\u2581LIST", xc, 3\\, '85', "\u2581Content", saleid, "\u2581fill", ']*)''',
        '233', op, '])*''', for, happy, hat, cats, "\u2581'_(?:", ad, pandas, people,
        "\xC3", "\xC3\x9F", property, default, "\u2581ms", "\u25811000.0", "\u2581\
          '...", ',...', ->..., "\u2581vf", "\u2581payload", "\u2581'3:8", hdf, /.../,
        firstSet, mark, "\u2713", "\u0420\u043E\u0441\u0441\u0438\u044F", fill, "\u2581\
          sequences", "\u2581'\\\\\"", upper, "\u258142", "\u2581kill", "\u2581process",
        "\u2581signal", "\u2581SIG", KILL, "\u2581Parse", File, xml, "\u2581setattr",
        Fire, Shot, 3%, '%2', '52', '9.', SECUR, ITY, REGISTER, URL, create, account,
        service, pkl, wb, xlabel, Temperature, "\xB0", '#($', circ, lists, "\u2581\
          500", green, 2012-05-, '29', '19:30', .%, fZ, tadas, reference, base, 64',
        "\u2581HttpResponse", "\u2581204", '003', "\u2581'01/12/2011", Button, Destination,
        )\\1+, "\u2581normalize", NFK, "\u2581title", "\u2581files", "\u2581'[0-9]+",
        .*\\, "\u2581'\"\\\\1\"", "\u2581Entry", META, HOST, api, \\(, '''(.*?)''',
        xyz, '987', perl, ui, replace, pl, "\u2581mydic", "\u2581Q", builtins, shutdown,
        records, "\u2581Time", Group, "\u2581conversion", trials, XXX, "\u2581site",
        "\u2581stuff", "\u2581savez", "\u2581tmp", "\u2581minutes", "\u2581combine",
        '[_%^$]', "\u2581'\\\\\\\\\\\\", <0>, "\u2581doc", "\u2581calendar", "\u2581\
          2002", '2008', "\u25812012", "\u25812000", command, another, "\u2581popen",
        "\u2581ret", val, '12454', Season, finditer, '(?=', race, track, Folder, aaabbbccc,
        "\u2581raise", specific, bad, thing, happened, know, hidden, ug, exception,
        expect, handle, "\u2581Runtime", "\u2581AssertionError", Unexpected, distance,
        "\u2581distance", "\u2581clear", "\u2581socket", et, nto, '130', '706', '433',
        ChildClass, "\u2581kwargs", "\u2581ensure", ct, "\u2581command", AND, "\u2581\
          param", "\u2581dest", )(, '+)(?:', )), '+(?!\\', "\u2581flip", "\u2581Comment",
        hot, ness, Foo, '%20', Bar, salary, bon, us, loop, "\u2581label", "\u2581\
          Base", "\u2581metadata", "\u2581tables", ticket, daily, history, "\u2581\
          bind", tbl, "\u2581exclude", "\u2581pre", req, sites, status, window, scroll,
        To, '(0,', document, body, Height, following, sibling, Update, config, Product,
        ion, Config, "\u2581Point", "\u2581namedtuple", what, purpose, "\u2581verbose",
        '18', '283', '88', '470', '579', '757', person, "\u2581urlencode", "\u2581\
          indices", whatever, "\u2581'456'", 789', ghi, 1\, 2\, bgcolor, FFFF, CC,
        Za, '0-9_]*', GOO, G, AAPL, "\u2581oldstr", "\u2581scipy", "\u2581sparse",
        "\u2581csr", matrix, "\u2581column", rating, movie, tri, surf, "\u2581XS",
        YS, "\u2581Z", 55', '>>', "\u2581Doc", geo, loc, limit, un, executable, "\u2581\
          SomeModel", pic, QP, SS, SQ, "\u2581table", points, '5.0', '7.5', '8.1',
        '6.0', "\u2581nums", "\u2581expanduser", "\u2581view", "\u2581'{},", won,
        "\u2581save", tweeter, '#2:', "\u2581cv", war, ped, cart, ter, regress, arg,
        "\u2581median", mv, somedir, /*, NET, USE, DELETE, click, lollll, static,
        /(.*), "\u2581Static", Handler, seq, "\u2581dec", sock, "\u2581SOL", SOCKET,
        "\u2581SO", RE, ADDR, "\u2581myFunc", iadd, es, getitem, "\u2581invert", "\u2581\
          out", translated, Text, used, "\u2581scale", +(, '+)?)', "\u2581'34", bottom,
        qux, "\u2581cut", "\u25811.0", "\u25810.15", "\u2581'(<", action, ')([^',
        ']+)''', login, "\u2581mixed", Features, 0\, Title, Here, ']"""', city, "\u2581\
          div", "\u2581left", "\u2581bottom", "\u2581right", "\u2581top", "\u2581\
          cmd", period, "\u2581period", screen, capture, '#\\1', "\u2581register",
        namespace, '2000', latitude, longitude, ftp, )$', Id, result, sam, yyy, "\u2581\
          alphanum", "\u2581CELERY", AL, WAY, AGE, ul, '...', span, hover, arguments,
        '[0]', style, border, solid, '002', 20', "\u258110031", '00314', '00315',
        "\u2581Animal", startswith, "\u2581sock", return, last, ert, xaxis, long,
        that, want, "\u25B2", DEBU, "\u2581basicConfig", "\u2581Group", "\u2581player",
        Player, '(?!', from, "\u2581card", ']\\', All, Alaska, Alabama, Arkansas,
        Samoa, California, Colorado, "\u2581unittest", "\u25810.5", "\u2581programs",
        ork, subplot, '2012', '-06', '-25', '17:', '0.2', 000', UK, '[1,2,3,4]', '4,3,2,',
        '])"', "\u2581txt", wiki, )/, "\u2581vectorize", feature, names, "\u258127",
        "\u2581PeriodIndex", "\u2581sleep", Birth, uc, Sex, "\u2581coll", field, exists,
        slug, '\\([^\\', )|, "\u2581stor", Data, employe, "\u2581'../", nodes, main,
        anufacturer, ch, WIN, fn, physic, volume, chem, istry, "\u2581multi", server,
        "\u2581desired", hour, weekday, weeknum, query, instance, quux, medals, Auth,
        "\u2581linestyle", redis, push, "\u2581melt", Agent, Application, "\u2581\
          clicked", subject, activity, '(.*?)(', Argument, Returns, '*)', '?$''',
        "\u2581convert", RGB, '55', '063', 000000', "\u2581relationship", Parent,
        "\u2581backref", children, "\u2581lazy", 'no', load, "\u2581COUNT", RIES,
        AS, spaces, xticks, '0,', '),#', '#(1,', '1,0', ')]', "\u2581255", Tag, sta,
        insert, into, egg, '#(''', "\u2581threading", "\u2581Thread", "\u2581target",
        "\u2581Suds", ove, ja, Park, ick, see, important, PROJECT, ROOT, english,
        tsv, "\u2581this", RDD, "\u2581sc", "\u2581parallelize", "\u2581cache", unset,
        "\u2581Lo", hadoop, daemon, stop, task, email, LIKE, '#''%', "\u2581'136",
        '#139', '24', ity, "\u2581'//", exact, "\u2581webdriver", "\u2581Firefox",
        "\u2581sel", ()', "\u2581extract", locator, "\u2581Max", NL, ocator, "\u2581\
          integer", "\u2581home", Downloads, "\u2581sns", white, grid, axes, "\u2581\
          ws", "\u2581Range", "\u2581Characters", about, music, photos, stuff, contact,
        "\u2581msg", total, '4096', '400', "\u2013", "\u2581'2010-", '0:33:5', '278',
        "\u2581vol", "\u2581volume", "\u2581put", "\u2581package", have, '{0.', price,
        ECHO, Ni, '-]{', '63', '})', Min, Mon, Jul, '#09', ':20:2', '#+0000', '+0',
        precedingWord, comp, "\u2581author", (.+)(, \\1\\, )+', '#\\(\\', +\\), James,
        25', mah, root, /$, views, view, ight, seven, miles, ward, counter, '''),',
        "\u2581take", '15', '}{', '{2:', WARNING, '25', '#10:', "\u2581folder", printing,
        blue, ol, STOP, "\u2581regex", ie, so, grp, bla, params, "\u2581direction",
        out, mat, wx, helloworld, cd, Qu, IV, eg, ap, age, "\u258113", play, "\u2581\
          stride", "\u2581de", Label, change, "\u2581STATIC", bo, horse, exp, "\u2581\
          at", "\u2581'123", '92', '786', '_]+''', "\u2581lis", arr, '#(?)', "\u2581\
          cdf", temp, spa, "\u2581event", GC, "\u2581poly", "\u2581polyfit", "\u2581\
          '2000-", 1-1, 31', cert, pem, '{4}', equal, '%02', "\u2581yield", "\u2581\
          Request", "\u2581callback", "\u2581meta", Friday, Saturday, '{1,2}', "\u2581\
          configure", "\u2581background", black, "\u2581spines", right, visible, ff,
        ue, Mt, AT, '"\\', Event, Status, "\u2581using", non, database, "\u2581rdd",
        ByKey, "\u2581collect", "\u2581region", numeric, "\u2581errors", coerce, '>\\',
        '{4})', REM, OTE, "\u2581store", region, category, "\u2581axes", stacked,
        ok, mon, dat, "\u2581fmt", package, '([^\\', ']+)', Coverage, Col, 16', scale,
        "\u2581subs", '[^/]+', "\u2581seconds", 40', '14', "\u2581'12", '6:', '{:.2',
        "\u2581amount", Two, One, eyecol, media, quantile, km, ijk, "\u2581'1234",
        lc, "\u2581sign", "\u2581nested", gnome, terminal, proc, "\u2581env", "\u2581\
          admin", "\u2581Blog", Admin, "\u2581Ellipsis", gx, "\xC2", "\u2581gtk",
        ylim, '0.0', "\u2581asarray", "\u2581urlpatterns", "\u2581patterns", "\u2581\
          fields", author, "\u2581queryset", custom, "\u2581numeric", half, circle,
        round, "\u2581jsonify", eq, "\u2581'\\\\\\\\?\\\\", J, ic, And, Tiger, ily,
        "\u2581'(?<=//)", "\u2581piv", mesh, "\u2581Port", Stem, mer, "\u2581stem",
        word, gh, tan, Japan, Unit, Arab, mi, rate, New, "\u2581tk", "\u2581Tk", "\u2581\
          photo", SERVER, "\u2581PhantomJS", phantomjs, '9.7', radio, SR, FILE, store,
        "\u2581cycle", ohlc, "\u2581escape", "\u2581safe", cap, revenue, CET, ikl,
        brav, charlie, delta, BODY, "\u2581bigram", measure, "\u2581nltk", "\u2581\
          col", locations, "\u2581Bigram", Assoc, Measure, fox, "\u2581'{}\\", "\u2581\"\
          \"\"1", '**', "\u2581coo", "\u2581lift", "\u2581temp", DF, (.*)</, </, "\u2581\
          Foo", gbts, "\u2581mercur", atleast, lives, "\u258133", '507', localhost,
        '2222', erge, tab, "\u2581tang", ent, lambda, textarea, .*, ).*, "\u2581multiprocessing",
        Cycle, domain, '041', 0438, '044', self, "\u2581testbed", "\u2581setup", cb,
        Hi, "\u2581hist", Letter, "\u2581license", contents, "\u2581Person", pet,
        Na, Content, Type, urlencoded, charset, SHOW, TABLE, FooBar, golf, CA, RT,
        "\u2581ids", "\u2581prod", pred, sda, "\u2581predict", "\u2581'(.)\\\\1",
        "\u2581django", "\u2581template", loader, template, dt, elt, "\u2581entry",
        Maximize, "\u2581req", Referer, "\u2581login", AAAA, '1.11', "\u25812.2",
        '3.33', "\u2581TEMPLATE", CONTEXT, PROCESSOR, django, core, context, processors,
        request, "\u2581points", "\x01", Your, been, created, "\u2581master", "\u2581\
          sha", widget, <1>, "\u2581serve", forever, "\u2581mapping", "\u2581Motif",
        south, carol, SC, north, NC, "\u2581nx", Component, Report, xls, '#5)', msg,
        13', "\u2581boxplot", liers, "\u2581cased", "\u2581flags", tie, ho, pan, ts,
        jack, "\u2581'([0-9]+", '10000', qu, ack, mysql, "\u2581FILES", image, '1000',
        '|=', ')?(?:', )|\\, "\u2581redirect", cess, plot, alpha, beta, sigma, (*)#,
        asset, '1234', '47', "\u2581Min", bottle, Give, profi, fo, az, unk, zip, "\u2581\
          resp", session, expires, )*, without, "\u2581'+", zeros, co, GH, JK, "\u2581\
          buffer", location, HEADER, 456', "\u2581anchor", NW, '86', combine, "\u2581\
          views", "\u2581Combine", API, View, "\u2581111", Press, continue, "\u2581\
          each", HSV, If, po, way, pounds, gives, pound, cal, then, eat, much, she,
        eigh, repo, ro, empty, uid, STORE, FLAGS, See, "\u2581solve", "\u2581logger",
        '1989', mvmt, 'NULL', country, gender, industry, "\u2581mystr", "\u2581std",
        argmin, XYZ, dd, "\u2581capitalize", "\u2581dist", flags, tags, "\u2581cb",
        formatter, "\u2581Func", Formatter, fmt, "\u2581MM", barh, ier, use, misc,
        mread, flower, "\u2581uint", \\\\, '(.*?)\\', nunca, +(\\, +)\\, '[0-9', ']+',
        ']+\\', VM, "\u2581pyodbc", SN, tic, DB, UID, PWD, mypassword, "\u2581totals",
        "\u2581good", '#{1}''', "\u2581'0.0.0.0", "\u2581'1.0", .0.0., "\u2581'1.1",
        "\u2581patch", facecolor, "\u2581Model", "\u2581position", "\u2581F", "\u2581\
          4.5", '<<', "\u2581walls", dom, Can, familiar, cccc, aspect, shutil, mongo,
        "\u2581subject", results, components, ')]+\\)', "\u25812013", "\u258132",
        "\u2581urls", (", (), Open, Low, High, invalid, "\u2581gender", "\u2581cherrypy",
        "\u2581quick", "\u2581P", ple, PDB, omggg, fun, ')|(?', $), "\u2581Employee",
        eng, rank, bricks, chrome, '836', '780', hard, successful, failed, Integer,
        Float, only, add, "\u2581uniform", "\u2581cutoff", "\u2581forms", "\u2581\
          contents", SE, "\u2581function", library, "\u258140", "\u2581sess", "\u2581\
          initialize", variables, target, "\u2581render", "\u2581mpl", "\u2581use",
        WX, Agg, oardsize, USER, IS, ADMIN, "\u25810.0", identity, '([0-9]+)', Home,
        bi, double, uo, Activity, topic, hel, bye, "\u2581'100", "\u2581contour",
        "\u2581levels", ntialias, "\u2581fromfile", client, ip, ROUTE, mypackage,
        run, worker, queue, "\u2581crosstab", convert, ar, ten, "\u2581ssh", missing,
        host, olicy, "\u2581paramiko", "\u2581Auto", Add, Policy, =0, look, rest,
        ing, sp, Timer, "\u2581delay", "\u2581weekdays", Wednesday, Tuple, il, ver,
        "\u2581qs", "\u2581Sum", amount, "\u2581pycurl", WRITE, FUNCTION, but, DROP,
        IF, ano, oog, Ch, mo, "\u2581assertEqual", "\u2581summed", "\u2581xy", "\u2581\
          5.0", coords, offset, '#%(', adult, idxmax, github, "\u2581link", jk, kl,
        lm, '6,', Failures, Tests, which, will, joined, second, "\u2581ask", "\u2581\
          bytes", "\u2581comp", compression, short, sentence, somevar, ssh, customer,
        inv, ice, copy, ''').', isibility, read, our, ke, books, ahalanobis, sq, dist,
        "\u2581Sig", "\u2581Template", Category, "\u2581animal", "\u2581extent", elegi,
        "\u2581probabilit", bytes, "\u2581screen", "\u2581blit", We, Love, Dict, farm,
        fruit, figure, "\u2581Chrome", ium, chromedriver, "\u2581'2011-", '45', '+0000',
        earchResult, ranking, '+(?=[^[', ']+$', "\u2581matching", bat, "\u2581'{:",
        "\u25812.3", '67', MAIL, "\u2581byte", little, tor, '{0}', '}}', PASSED, smallest,
        "\u2581'0.0.0.0'", "\u2581members", myDict, ')|(?<=\\', '055', '87', Jim,
        '/(?', backend, "\u2581merged", Gray, PNG, '(?=\\', '|$)', avg, rU, STRING,
        "\u2581button", "\u2581Button", wt, '56', '79', '205', '3747', msave, outfile,
        "\u2581width", "\u2581height", hstack, (1), bases, subclasses, __', "\u2581\
          draw", si, "\u2581factorial", categories, "\u2581play", timedelta, "\u2581\
          pretty", lose, "\u2581determine", Epoch, "\u2581member", "\u2581entity",
        Out, Connection, "\u2581pip", show, pyodbc, "\u2581uuid", '1234567', '8.4',
        "\u2581unit", "\u2581pytz", "\u2581timezone", Australia, Melbourne, '99',
        '|[^', parent, "\u2581repr", confirm, "\xCF", "\u2581difflib", SequenceMatcher,
        "\u2581Tee", "\u2581phone", "\u2581redis", conn, "\u2581Redis", pool, "\u2581\
          5.2", "\u25816.1", '.98', '0.3', "\u2581'0.5", "\u2581city", Population,
        "\u2581inner", "\u2581regexp", '>[^/]+)/', users, '>[^/]+)', cm, "\u2581128",
        "\u2581Flask", iter, programmer, Re, Ex, "\u2581errorbar", yerr, "\u2581err",
        "\u2581contrib", "\u2581authenticate", "\u2581username", "\u2581password",
        '/?', '3,4', cookies, friend, "\u2581ImageField", images, Disposition, attachment,
        fname, "\xF3", +/, tr, lat, '444', lon, ':555', YOUR, "\u2581modules", "\u2581\
          poll", "\u2581Poll", "\u2581prefetch", related, "\u2581Frame", ov, Sequence,
        Start, End, Redirect, REFERE, "\u2581hour", "\u25815.5", didn, "\u2581decoded",
        over, both, through, selves, before, her, had, should, under, during, now,
        each, further, ew, because, doing, above, between, who, were, down, their,
        too, was, until, don, those, below, can, any, if, when, after, most, such,
        why, having, once, "\u2581bytearray", 01\, 02\, 03\, "\u2581ordered", merge,
        setitem, unique, identifier, param, "\u2581like", RGBA, ube, rc, Cap, mad,
        '{3}', '].*', "\u2581grid", "\u2581Report", "\u2581quantile", remaining, "\u2581\
          corr", coef, normal, '\\]', )*), call, DE, "\u2581book", sheet, '#2''',
        "\u2581rec", arrays, freq, '])([', -\\1, ai, "\u2581Scalar", "\u2581IP", PROTO,
        TCP, "\u2581TCP", NODE, LAY, "\u2581aapl", Model, John, Doe, "\u2581vals",
        well, sudo, 99', "\u2581node", "\u2581getElement", sByTagName, "\u2581child",
        Node, xlim, "\u2581pickled", "\u2581'2000-01-0", efact, Form, street, Sachin,
        ulka, SET, SIZE, '748', '36', testing, "\u2581properties", pkg, "\u2581To",
        owner, "\u2581curr", "\u25815000", "\u2581')'", '])(?', "\u2581sck", '{0}''',
        '23', weekly, visitors, "\u2581daily", engine, postgresql, "\u2581echo", "\u2581\
          0.62", "\u25810.3", "\u2581warnings", "\u2581warn", warning, "\u2581submit",
        rk, "\u2581utc", '848', '39', "\u2581sudo", pressure, "\u2581ones", "\u2581\
          Product", Serializer, 11', "\u2581'22'", 33', Image, available, '>=', "\u2581\
          reader", Row, "\u2581empty", "\u2581linewidth", '":"', '"}', annot, repr,
        autodoc, cmap, gray, glet, '235', "\u2581'17", demand, Com, "\u2581series",
        "\u2581source", years, '1.2', 0000', content, UP, GRADE, inventory, mac, ax,
        spect, ee, "\u2581entries", "\u2581assert", AKE, 23', Source, '4.3', '53',
        import, "\u2581reactor", "\u25810.6", '31', "\u25810.9", '27', "\u25810.002",
        '68', '.66', '3594', '60', cheese, cake, art, items, navigat, wrapper, Script,
        "\u2581Tkinter", "\u2581askopenfile", START, "\u2581networkx", networkx, labels,
        "\u2581pos", "\u2581labels", globals, "\u2581filters", part, "\u25811.5",
        "\u2581ha", center, Not, Set, "\u2581\"\"\"^", rss, '>.+)/$', "\u2581pixmap",
        "\u2581QtGui", "\u2581QPixmap", cnn, "\u2581'^(?", +)/$, "\u2581MyView", nk,
        ir, Oh, ks, remember, tim, ry, guido, "\xD1\xF1", "\u2581K", lass, "\u2581\
          iterable", paper, lfw, "\u2581Terminate", "\u2581point", "\u2581hue", LOG,
        ylabel, threaded, GPS, Permission, denied, "\xD7", cont, office, "\u2581xlabel",
        Primary, GIF, trie, ini, days, '91', 18', "\u2581pdb", trace, Int, "\u2581\
          gc", "\u2581auto", "\u2581Timestamp", "\u2581'2014-01-0", FR, FI, ZZ, '234',
        '35', "\u2581handle", Line, '(?,?)''', "\u258138.", recursive, "\u2581For",
        ked, "\u2581counts", ']+"', "\u258118", "\u258119", "\u2581cos", radians,
        "\u2581sentence", Long, Med, 'Yes', '1116', '372', "\u258135", "\u2581mp",
        probe, Box, "\u2581QDialog", Reset, ModelChoiceField, GRA, "\u2581selenium",
        "\u258132.4", '32.8', async, exchange, "\u2581routing", $""", "\u2581\"\"\"\
          {:", '1,', '1,1', '2,', '4,', '4,5,6', "\xC2\xA3", dev, dv, point, "\u2581\
          sendline", "\u2581SetSizer", AndFi, sizer, "\u2581student", "\u2581'6",
        htm, "\u30AF\u30EC\u30A4\u30B8\u30FC\u30FB\u30D2\u30C3\u30C4", '!"""', HL,
        IGN, player, "\u2581tst", MyVar, Student, Tom, "\u2581field", vimeo, "\u2581\
          embed", "\u2581ob", caption, arrow, move, xs, ()", expanded, '.5', "\u2581\
          setWindow", Flags, "\u2581QtCore", "\u2581Qt", Minimize, "\u2581Dynamo",
        mymethod, "\u2581callable", EMAIL, WAIT, "\u2581nunique", EFF, "\u2581attrib",
        "\u2581filepath", "\u2581messages", "\u258126", "\u2581weekday", VP, '46',
        '744', '37', 095, "\u2581attributes", "\u2581pred", tbody, submodule, '+250',
        bz, TASK, IM, firefox, '00,000', "\u2581clf", "\u2581\"\"\"^(?", '0-9]', ',61}[',
        na, aaaa, ppp, abcde, TimeStamp, "\u2581ode", "\u2581456", "\u2581defaultdict",
        "\u2581'110", '"]/', CREATE, INTEGER, PRIM, ARY, also, redirected, rain, fqdn,
        "\u2581spatial", euclidean, ps, subseq, model, "\u2581unravel", design, visit,
        "\u2581fft", "\u2581fin", "\u2581true", "\u2581localize", --', delete, '#...''',
        "\u2581ex", alter, links, bundle, resource, UN, IVE, tree, "\u2581shame",
        gm, '346', '179', '20', mkv, '1234567890', eggs, concer, tation, mail, Sales,
        "\u2581other", simulate, PRESS, "\u2581xml", "\u2581Set", Cell, "\u2581database",
        row, tweet, gallery, "\u2581'%.6", "\u2581fetchone", dude, "\u2581social",
        auth, "\u2581provider", "\u2581'...'", "\u2581'1/2", Filter, EM, OS, FO, latex,
        preamble, "\u2581ITEM", PIPELINES, apps, scrapy, pipelines, Persistence, Pipeline,
        "\u2581999", "\u2581lookup", "\u2581ii", pair, "\u2581cards", "\u2581HTTP",
        device, min, "\u2581V", please, question, oo, "\u2581vowels", "\u2581timetup",
        "\u2581origin", "\u2581aggregate", "\u2581pg", "\u2581mixe", "\u2581init",
        '001', "\u2581areas", "\u2581zipfile", "\u2581ZipFile", archive, rd, '{%',
        "\u2581mymethod", <2>, "\u2581joined", dataset, power, limits, "\u2581cipher",
        "\u2581decrypt", AAA, '(.*?)', ZZZ, "\u258123", "\u2581something", "\u2581\
          repo", "\u2581git", origin, keep, deriv, poly, Match, Conflict, "\u2581\
          submenu", "\u2581menu", Action, Visible, ik, "\u2581discard", Column, notnull,
        WORD, SPARK, jkl, "\u2581'||", "\u2581zs", notepad, '2,3', '*.*', fetch, "\u2581\
          tm", Cursor, Pos, "\u2581sent", lalala, "\u2581families", Notepad, housing,
        Count, Color, rettify, Var, computing, "\u2581getpass", "\u2581cls", "\u2581q",
        "\u2581clean", "\u2581address", send, Good, README, "\u2581od", depth, indent,
        reshape, '02', reader, "\u2581webpage", "\u2581feed", \\1*, )(\\, ')(?=',
        FG, apabilities, version, Val, tup, "\u2581'7", '-10', 15', private, symbol,
        doc, "\u2581initial", "\u2581newlist", India, USA, Other, "\u2581zlib", "\u2581\
          decompress", lice, eth, 02', ec, '58', "\u2581argv", "\u2581indicator",
        "\u2581File", "\u2581Main", Loop, '65536', "\u2581ports", Time, scatter, partial,
        EV, rec, "\u2581age", atty, "\u2581btn", "\u2581stick", "\u2581E", "\u2581W",
        active, cars, LD, LIBRARY, PATH, sorted, "\u2581intersect", yellow, disabled,
        "\u2581resize", dictionaries, '8.0', "\u25817.0", '9.0', '4.6', "\u25818.0",
        '4.0', "\u25818.9", '3.0', "\u25817.7", yo, '{}"', ticker, math, "\u2581ElementTree",
        Message, "\u2581SOCIAL", AUTH, FACE, BOOK, SCOPE, friends, dns, omatic, GET,
        profile, Profile, "\u2581dispatch", phase, "\u2581stats", "\u2581http", "\u2581\
          webapp", "\u2581WSGIApplication", "\u2581install", "\u2581opener", hypergeom,
        pm, "\u2581rnd", '450', '678', local, "\u2581span", deleted, "\u2581tensordot",
        route, web, league, pt, "\u2581gethostbyname", rr, letters, "\u258149", '57',
        '.-]+', "\u2581quoting", "\u2581QU", MINIM, "\u2581masked", "\u2581interpolation",
        nearest, "\u2581application", "\u2581tornado", "\u2581Application", "\u2581\
          hello", "\u2581fruits", "\u2581tokenize", tokenize, How, politicians, '?://',
        keys, "\u2581Excel", Writer, "\u2581excel", open, ca, Format, '00:00:00',
        "\u2581condition", '(?=(?:', '\''"]', '"[^"]*")*', pw, nam, ix, "\u2581pw",
        ((, )\\2), bbbb, cpp, '#10', "\u2581MultiIndex", levels, lab, "\u2581stopwords",
        "\u2581188", '187', '869.4', Logger, Street, "\u2581indexing", "\xD1", "\xCB",
        single, '+(?=', '{1,6553', "\u2581convex", ll, "\u2581people", Write, icon,
        "\u2581Immutable", Immutable, iterator, "\u2581keep", Zero, parts, "\u2581\
          named", Window, WINDOW, NORMAL, Info, "\u2581shuffle", )", ASCII, "\u2581\
          masks", YourApp, close, "\u2581rate", "\u2581Syn", able, Mixin, LIST, Dog,
        ill, '#25.5', .""", enc, ia, "\u2581\"\"\"{0:0", "\u2581NOT", "\u2581urljoin",
        LIMIT, '={', '#{0:', '".*?"', NORTH, OUT, EA, EST, tables, "\u2581client",
        "\u2581'---", "\u2581circles", Hough, Circle, "\u2581gray", CV, ENT, received,
        none, getElementById, lg, Blah, "\u2581transaction", Response, PR, ids, "\u2581\
          12345", "\u2581Positive", Small, IntegerField, "\u2581xmlstr", 29', gu,
        system, uuid, favorite, "\u2581gp", "\u2581expect", news, combinator, "\u2581\
          unescape", match, "\u2581'2.0", '2.1', '231', '1.1', "\u2581vec", Representative,
        INTER, "\u2581PYTHON", DEFAULT, VERSION, "\u2581triu", minor, '","', blank,
        method, wrapped, "\u2581listOfL", ists, book, destroy, quit, ring, Some, STORAGE,
        proj, channel, models, Custom, Social, Storage, "\u2581bins", "\u25810.25",
        "\xC3\xA1", CB, linewidth, "\u2581'</", "\u2581links", "\u2581colormap", Paired,
        "\u2581handler", phylo, press, "\u2581namespaces", fliplr, Stdout, merged,
        '#-.:', '8:10:20.856000::', "\u2581'('", pend, ies, pycharm, debug, colwidth,
        '"#', "\u2581JsonResponse", ichael, tColor, "\u2581COLOR", BGR, stylelistrow,
        tooltips, collection, Will, iam, Speak, Like, "\u2581Null", "\u2581'[\"",
        ',"', kron, "\u2581eye", Progress, "\u2581farm", newfile, writelines, dammit,
        "\u2581\"\"\"{{", '{0}:{1}', onjour, '62', '0.17', uck, "\u2581'*", PtsPer,
        Order, Num, Lot, "\u2581Player", GRAY, Attribute, "\u2581rev", multi, timezone,
        Eastern, "\u2581WEEK", AYS, ri, '[^.]*', jh, fig, "\u2581600", "\u2581option",
        "\u2581cl", posts, '#?''', "\u2581listener", '"([^"]*)"', Variable, "\u2581\
          From", "\u2581\"\"\"{0:", "\u25811.679", logger, "\xC4", "\u2581star", "\u2581\
          dat", um, MEDI, Another, Backup, chair, "\u2581H", sub, \\/, '000000001',
        "\u2581minimum", "\u2581ioloop", "\u2581IOLoop", "\u2581assign", "\u2581wm",
        Got, kill, Tracker, "\u2581exception", CLASS, EP, OUR, NUMBER, AR, TITLE,
        '[{}]', thefile, "\u2581getroot", "\u2581newList", em, el, '",', "\u2581error",
        Cost, '70', pad, ssl, "\u2581Post", phrase, "\u2581Pool", "\u2581processes",
        tasks, child, "\u2581aggregated", "\u2581orient", '4.1', "\u2581ContentFile",
        lte, financial, outcome, '#{:.2', "\u25811.2345", Txt, Choice, CONTENT, ITEM,
        india, ami, ash, win, boxes, "\u2581Print", '860386', '497', "\u25812.7",
        '58984', '977', '6825', '404', '717', '439', '69', '44', '9723', '552299',
        '97', '634', hexlify, "\xCE", "\u2581module", reset, '((?', '(?', '{1,', "\u2581\
          '2014-0", lst, pi, "\u25812.71828", theta, "\u2581EC", located, "\u2581\
          By", searchbox, exit, agg, job, proxy, "\u2581socks", "\u2581PROXY", TYPE,
        SOCKS, "\u2581'127.0.0.1'", "\u258190", "\u2581python", "\u2581MyObject",
        ure, ary, Yay, Tour, "\u2581seed", gap, '00000', 03', "\u2581ttk", "\u2581\
          Style", "\u2581relie", flat, "\u2581border", mpl, logo, "\u2581wanted",
        '-----', Help, desk, nnz, iff, car, rat, nohup, "\u2581devnull", rollaxis,
        "\u2581symlink", ugh, la, '842', '867', '94', Crop, PDF, dashboard, "\u2581\
          partial", res, hold, "\u2581difference", "\u2581imag", average, "\u2581\
          average", "\u2581somedict", gif, Smith, Ro, "\u0101", "\u2581ndim", arbage,
        "\u2581readline", '8:00', '12:30', '1:4', uncomp, Size, tk, compressed, encode,
        mary, "\u2581'70", ada, references, Term, =1', secret, longest, "\u2581fillvalue",
        "\u2581players", ting, gt, delhi, '[^"])*', youtube, watch, Ki, ping, "\u2581\
          transmission", "\u2581zero", great, positive, acceptable, "\u2581usecols",
        '1,2,3,4,5', "\u2581complete", headline, "\u2581cm", "\u2581hot", MyString,
        "\u2581exp", cacert, Admi, ssion, newlines, initial, hypot, Mary, lamb, projects,
        Est, administration, "\u2581'30", hl, "\u2581'%.0", "\u2581sec", '#1,', hanning,
        "\u2581Type", '+[.]', sure, Team, Pass, rsync, sync, "\u2581inspect", awesome,
        "\u2581\"\"\"(", '])+', "\u2581'-0.2", blu, "\u2581'0.1'", "\u2581perm", oldName,
        newName, force, LDAP, '2.0', ']]''', hline, "\u2581lw", Font, serif, "\u0BAA",
        "\u0BAE\u0BCD", "\u0B9F", "\u2581Dis", restaurant, "\u2581pymssql", ED, DESKTOP,
        ball, population, prompt, extensions, "\u2581boto", "\u2581big", "\u2581DateTimeField",
        full, APP, DATA, settings, glob, triggered, callback, 'True', subclass, "\u2581\
          Form", vega, amel, Case, '8577', '106', disk, "\u25813.0", mno, pqr, needs,
        ctrl, shift, "\u2581'<!--", modified, undefined, "\u2581xlim", MENU, rep,
        "\u2581frac", "\u2581prec", ':<10}', cnt, Panning, '#==', suffix, lowercase,
        DISPLAY, proxies, "\u2581Response", articles, Sample, "\u2581'%02", ',%05.',
        curve, "\u2581PDF", rasterized, ransparency, eps, "\u2581YourModel", published,
        mlcharrefreplace, "\u2581categories", pk, )|(, '(?<=\\', dogs, "\u03C4", "\u03C1\u03BD",
        "\u03C2", "\u2581INFO", options, '[2]', "\u2581better", "\u2581numbers", +)(,
        Score, student, "\u2581latest", Symbol, '"[\\', '!?', "\u2581stop", internal,
        collapsed, spacing, '222', "\u2581xx", "\u2581thumbnail", JPEG, "\u2581quality",
        expensive, "\u2581Car", company, '[^][]*', blog, qualified, "\u2581myint",
        "\u2581cat", quantity, Pro, te, Green, quis, Michael, ulli, filters, '>.*)',
        brown, jumps, lazy, '({})', \\1), "\u2581limit", "\u2581newpath", "\u2581\
          person", birthdate, height, winfo, With, Field, '7,', "\u2581bit", "\u2581\
          sin", "\u2581counter", fggfg, ggg, chunksize, "\u258120000", Doing, "\u2581\
          fcntl", ctl, SIO, CS, ABB, access, token, "\u2581Object", fe, '837', '994',
        "\u2581withColumn", "\u2581lit", '([^-]', '128', "\u2581windows", ua, require,
        '0-9])', "\xC3\xB6", oauth, vline, '2015', "\u2581cnx", "\u2581encoded", Safari,
        quiet, Address, "\u2581aware", Pacific, "\u2581fp", parametri, SU, GV, Detail,
        '")''', "\u2581MyForm", ever, payload, "\u2581mime", tiff, "\u2581block",
        '8,', mul, '3,', "\u2581recursive", event, "\u2581timeout", super, valid,
        corn, uni, cycle, website, hostname, "\u2581Text", "\u2581mark", safe, "\u2581\
          70", "\u2581FILE", report, "\u2581api", update, "\u2581tweet", making, public,
        Party, AN, "\u2581theta", ':%02', BAD, "\u2581angular", "\u2581fluid", "\u2581\
          pic", AVE, LIB, "\u2581packages", anaconda, "\u2581ec", instances, Do, se,
        expected, got, "\u2581projection", Book, '0.4', "\u2581simple", filter, always,
        "\u2581yourlist", ments, Trial, ==, "\u2581layout", Widget, Unicode, Filename,
        "\u2581genre", comedy, '8.6', '666', '66666667', "\u2581scroll", nse, frac,
        must, longer, '#6#', Central, members, argvalue, err, segment, erial, "\u2581\
          dc", "\u2581Get", '\\[([^\\]', goose, "\u2581mgrid", '21.0', "\u25813.5",
        enough, "\u2581context", "\u2581paragraph", '(?!(?:', bus, phi, .1', requires,
        PIL, '131', "\u258128", "\u2581candidates", di, "\u2581dx", "\u2581dy", "\u2581\
          offset", "\u2581graph", Subject, help, "\u2581UDP", PORT, "\u258148", "\u2581\
          letters", "\u258180", LOAD, FOLDER, qr, '}/{', "\u2581longest", qs, =1,
        "\u2581rest", "\u2581whatever", "\u2581ratio", magic, "\u2581icon", bitmap,
        ard, lan, ico, configure, "\u2581weight", Auto, Hel, fast, "\u2581fus", "\u2581\
          ',.", cj, "\u2581single", "\u2581121", "\u258134", "\u258176", "\u2581manager",
        gunicorn, "\u2581Gunicorn", Server, "\u2581pairs", "\u2581move", sink, "\u2581\
          naive", ment, "\u2581valid", DIR, "\u2581BASE", cms, templates, allauth,
        "\u2581management", syncdb, "\u2581interactive", har, ville, Domain, Recommend,
        Suppress, cor, definition, "\u2581ranges", qwer, "\u2581pl", "\u2581change",
        pg, SIGTERM, ':!', '%%', bool, "\u2581tzinfo", erdam, varchar, fred, '768',
        '301', '4850', '5160', "\u2581complex", rslt, participants, "\u2581ManyToManyField",
        "\u2581related", Parser, indices, ind, Input, "\u2581say", "\u2581Tree", QuerySet,
        team, "\u2581ticklabel", sci, "\u2581IMAP", bfill, network, share, Root, "\u2581\
          My", ListView, entry, "\u2581transport", "\u2581message", "\u2581cell",
        "\u2581statN", "\u2581cbar", ability, squeeze, "\u2581\"\"\":\"\"\"", "\u2581\
          curses", income, "\u2581Media", ized, priority, '660', "\u2581local", "\u2581\
          convolve", many, "\u25810.7", vals, "\u2581subplot", '{2}', recipes, "\u2581\
          tota", "\u2581sprite", barz, "\u2581Users", "\u2581eq", older, subfolder,
        rf, vel, mask, "\u2581blank", "\u2581800", may, bill, lena, rad, ana, '\\.(?:',
        uzz, Hour, "\u2581dataframe", "\u2581tz", localize, UTC, "\u2581rolling",
        "\u2581formatted", Records, Price, "\u2581normal", norm, sensitivity, rng,
        "\u2581Photo", tele, phone, "\u2581grou", cols, "\u2581Fixed", chain, "\u2581\
          indent", "\u2581middle", "\u2581CharField", "\u2581null", "\u2581ssl", certificate,
        "\u2581443", gram, abcdefghijk, lmnopqrstuvwxyz, "\u2581rng", okay, "\u2581\
          maximum", "\u2581MySQLdb", "\u2581charset", NAMES, Game, "\u2581'285/30/1",
        '315', 9', requests, socket, handler, "\u2581Stream", "\u2581mode", "\u2581\
          compress", "\u2581MyApp", "\u25811.2", '333', legend, handles, csvfile,
        "\u2581Rules", extra, "\u2581zf", myproject, pipeline, "\u2581matcher", "\u2581\
          flask", "\u2581TO", "\u2581CC", "\u2581ndb", "\u2581StringProperty", "\u2581\
          repeated", Seat, "\u2581invite", "\u2581received", "\u2581crypto", gen,
        apples, real, '}]', Even, "\u2581xl", '#-->', Dir, Stat, Table, '[^"]*', "\u2581\
          xlwt", "\u2581easyxf", bold, '280', +%, tack, overflow, Speed, "\u2581vert",
        "\u2581Program", "\u2581Glob", "\u2581'*.", "\u2581sqlite", guest, TH, edge,
        milk, "\u0411", creature, bird, eagle, female, "\u2581stdscr", "\u2581getch",
        "\u2581EST", "\u2581owner", '!!!', FONT, HERS, HEY, SIMPLE, qual, QUA, ER,
        "\u2581Show", pil, ipl, "\u2581printable", "\u2581ticker", "\u2581Log", Locat,
        "\u2581ndarray", js, secs, hundred, twenty, '{0}.{1}', gene, NR, '4.5', '6.7',
        "\u2581created", Object, noun, "\u2581bools", "\xD0\xB0\xD0\xB1\xD0", "\u0301",
        odd, lookup, "\u2581smtp", "\u2581sk", "\u2581et", "\u2581settings", big,
        "\u2581subscript", '%.*', "\u2581wn", "\u2581synset", course, lemma, "\u2581\
          converter", Baltimore, av, ens, Pb, xdg, '#"%', 07', "\u2581week", "\u2581\
          tight", layout, current, future, "\u2581someList", Of, Element, "\u2581\
          document", FILES, "\u2581static", "\u2581Rec", "\u2581somevalue", "\u2581\
          matches", sizeof, "\u2581ru", "\u2581ncols", mro, Friendly, TT, AC, sqlite,
        required, '#{0}''', sys, "\u2581separators", '#/>', "\u2581Table", eep, "\u2581\
          optimize", "\u2581least", "\u2581residual", guess, crement, "\u2581termi",
        "\u2581tc", setattr, "\u2581TCSA", DRA, "\u2581memmap", "\u2581ser", process,
        FOR, FIELD, fail, "\u2581kdeplot", coord, recursion, "\u2581holes", "\u2581\
          build", Processor, "\u2581timeit", "\u2581expensive", "\u2581after", purchase,
        zzz, centered, mydatabase, park, lot, transaction, '245', "\u2581colors",
        "\u2581one", "\u2581blog", "\u2581cap", "\u2581Video", Capture, "\u258197",
        "\u258198", "\u258199", ite, tory, "\u2581uni", "\u2581bits", "\u2581record",
        hometown, York, university, "\u2581cov", kij, "\u2581\"\"\"(?", ake, Mo, roc,
        accounts, registration, backends, fullpath, nice, matplotlib, yticks, starttls,
        constant, hosts, "\u2581interpolate", "\u2581desktop", "\u2581stmt", else,
        drug, con, dense, ordered, stat, NaT, "\u2581UserAdmin", Mozilla, /5.0, ql,
        Query, Entry, edit, temperature, Results, passed, Settings, staff, LOCATION,
        FileName, work, "\u2581localtime", Series, '[+-]?', 3\, challenge, hallenge,
        "\u2581attempt", "\u2581dictio", QS, subprofile, "\u2581'(1.2).", "\u2581\
          fromarray", "\u2581interesting", surname, '}.', "\u2581pro", motion, "\u2581\
          fullscreen", ggle, "\u2581employee", Private, pigeon, hate, would, ore,
        expression, critical, nnerHTML, yesterday, newPic, pick, WARN, 'TRUE', "\u2581\
          scaled", "\u2581Keep", Ratio, poll, ur, git, ref, "\u2581'19", '-12', "\u032F",
        \\", "\u2581Link", popularity, "\u25810.75", "\u2581fun", pairs, hook, sister,
        correlation, ufeff, "\u2581customer", special, Up, interest, "\xE5", "\xE6",
        "\xA5", Short, '">%', "\u2581posts", mymodule, "\u2581mymodule", SH, ELL,
        "\u2581proxy", "\u2581Rotating", By, "\u2581backup", NF, "\xE7", multiple,
        face, "\u2581sympy", Who, ineapple, sea, '?#', Qt, CheckBox, undo, driver,
        bond, "\u2581prefix", "\u2581J", '150', "\u2581Project", "\u25810.016", '9160',
        '5834', '616', '1060', '25195', '053', '680', '19922', "\u2581Menu", ffff,
        ooooooooo, kml, "\u2581clone", Nothing, '...#', walk, wsgi, quat, ']],', mailto,
        "\u2581ItemIsEnabled", diagonal, Baz, mov, '#3)', xtick, ytick, XX, III, "\u2581\
          ALLOW", grams, "\u2581uniq", "\u25811234", sym, "\u2581alphabet", '014',
        04', '64[', "\u2581pool", myserver, "\u2581outputs", csrf, CSRF, Deal, showing,
        "\u2581dealer", "\u2581401", "\u2581doctest", "\u2581testmod", '20.0', newString,
        "\u2581pt", "\xC5", \\$\\, '+(?:\\.', '{2})', ME, BE, "\u2581infer", "\u2581\
          pp", "\u2581'123456789", "\u2581stripped", "\u2581ModelForm", "\u2581AF",
        INET, "\u2581SOCK", GRAM, "\u2581'{:02", "\u2581Item", enddate, "\u2581'1/1/2011'",
        "\u2581nat", German, "\u2581mdate", "\u2581Date", sun, ah, uk, record, "\u2581\
          integers", desired, )+|(, '{}#', soup, "\u2581handlers", setFormatter, "\u2581\
          '[0-9]{5,}", Repr, "\u2581bg", "\u2581cube", SubClass, Better, dst, idence,
        basic, rand, bits, '383', "\u2581binary", "\u2581'2.3", "\u2581'3.1", "\u2581\
          gevent", "\u2581jobs", defaults, npy, '613', quality, medium, "\u2581hwnd",
        gui, "\u2581GetForeground", colored, "\u2581red", 05', '800', udc, udfff,
        orange, CSV, "\u2581bottle", "\u2581Bottle", LL, binned, "\u2581describe",
        "\u2581subdomain", "\u2581hostname", "\u2581trim", Reference, Amount, "\u2581\
          price", "\u2581minorticks", pattern, '].', "\u2581power", '2.5', Run, "\u2581\
          dev", "\u2581profile", tp, parameters, "\u2581mx", "\u2581reg", '{3}\\',
        "\u2581Config", Section, Common, elm, DT, JJ, NN, "\u9A6C\u514B", "\u2581\
          dummy", Remove, "\u2581asyncio", "\u2581funcs", There, "\u2581mm", rainbow,
        Thing, manage, '#--', '+)?', mydir, "\b", PI, queryset, '\\[\\]]''', "\u2581\
          microseconds", "\u2581ticks", "\u2581cross", Mike, "\u2581Name", Jane, QUERY,
        "\u2581Gzip", "\u2581Field", "\u2581place", formed, "\u2581ZIP", LATED, azoo,
        Client, '276', '11.0', "\u2581500.0", global, At, plan, greyscale, APPLICATION,
        aton, TWO, Four, Seven, EIGHT, eni, "\u2581nfeature", aws, weather, ob, loss,
        "\u2581Bind", "\u2581EV", PA, INT, "\u2581On", Paint, pip, install, "\u2581\
          keywords", port, '204', grades, '4171', '74', MAIN, primes, "\u2581global",
        fdsa, "\u2581SIGINT", edges, "\u2581edge", "\u2581arrows", Host, "\u2581bisect",
        "\u2581sp", "\u2581formfield", ^.*\\.$, 0000-\, Adj, MA, ptr, "\u2581rgb",
        silly, seaborn, dark, palette, cloud, jet, "\u2581sq", sent, '(?:,\\', +)*,
        ci, pe, '30.0', "\u2581rdf", First, Third, esse, "\u2581un", register, "\u2581\
          Site", '[%]', '[{0}]', "\u2581sets", ':\', Unnamed, "\u2581visit", prop,
        LABEL, '"%', "\u2581cql", "\u2581filtered", "\u2581isdis", joint, "\u2581\
          Simple", For, '899', Paul, "\u2581widget", area, "\u2581mul", vision, "\u2581\
          lex", "\u2581mongo", GUI, "\u2581getsize", large, verb, metavar, specified,
        piechart, '0.1', Purchase, define, "\u2581listen", IP, '#{1}#', "\u2581'{{",
        '}}''', quad, auto, gb, "\u2581movie", "\u2581trimmed", buffer, "\u2581utf",
        "\u2581chart", '!$', orientation, menu, "\u2581234", types, "\u2581bid", "\u2581\
          Some", architecture, canvas, lower, "\u2581wcs", 84\, "\u0308", "\u2581\
          150", "\u2581Lock", Sub, Directory, urface, stride, "\u2581jet", "\u2581\
          celery", "\u2581task", Jack, Complete, "\u2581Key", Property, "\u2581combobox",
        dump, "\u2581mat", "\u2581facecolor", sed, "\u2581widgets", eli, picker, "\u2581\
          rectangle", mock, "\u2581dom", pre, cha, "\u2581ranks", cos, src, "\u2581\"\
          '%", MUT, ':(', Un, "\u2581greet", aw, ful, developer, etaddr, hon, VERBOSE,
        seen, Ask, hr, peter, jan, MIDI, Note, "\u2581track", "\u2581channel", pitch,
        "\u2581duration", third, "\u2581attach", "\u2581MIMEText", pretty, "\u2581\
          combined", "\u2581multivariate", colname, "\u2581ValidationError", least,
        confusion, DONE, article, parse, "\u2581symp", +1), -1), '+3', '**2', "\u2581\
          evaluate", "\u2581Data", "\u2581an", "\u2581'%.1", "\u2581serialized", "\u2581\
          serializers", "\u2581serialize", "\u2581console", "\u2581options", '790',
        '.4', COOKIE, "\u2581serializer", REQUEST, forecast, "\u2581MyList", tomato,
        "\u2581Format", going, ROC, pa, ce, "\u2581smaller", EAE, platform, '>]+)',
        "\u2581hashlittle", "\u25813735928559", ag, hg, "\u2581fruit", builtin, "\u2581\
          myfunc", robots, bmp, hobb, game, reading, ave, node, BAR, "\u2581between",
        ':00''', "\u2581existing", "\u2581slug", const, decl, PRE, TE, "\xC3\xA4",
        threading, March, April, Dec, "\u2581part", actor, "\u2581actor", wireframe,
        "\u2581U", myshare, om, "\u2581Find", Chrome, PID, "\u2581code", "\u2581interact",
        '824', TING, "\u2581schema", '0000000000.0', '-07', '00000.0', "\u2581floor",
        Geometry, FirstName, LastName, Mat, Jones, "\u2581dirs", Template, WITH, Max,
        Business, "\u2581permutation", idx, "\u2581'134", passwd, Email, "\u2581360",
        Core, "\u2581rollback", "\u2581'1999", ope, That, "\xF2", usetex, nested,
        DLL, Program, Files, Java, 1.8.0, "\u2581HelloWorld", PYTHONHOME, "\u2581\
          cluster", "\u2581Wi", ki, "\u2581rep", "\u2581Py", Finaliz, Distance, heat,
        '^{-2}', iteration, mgr, ipython, "\u2581history", manager, "\u2581pexpect",
        "\u2581spawn", program, TERM, "\xEB", LEFT, DC, LICK, Double, Click, "\u5E73\u6210",
        "\u2581'00000000", "\u2581256", water, Normal, save, roll, back, isalnum,
        au, "\u2581loop", "\u2581\"\"\"{:.2", '2606.89579999999', tools, "\u2581roll",
        "\u2581are", ijkl, Items, entries, absolute, "\u2581Wait", acc, "\u2581indexer",
        cl, "\u2581eastern", "\u2581eig", spaced, gree, bigger, skip, pixbuf, "\u2581\
          pixbuf", uth, "\u2581maximize", overlapping, '%%''', Red, '0511', alert,
        "\u2581accept", Prompt, inverse, "\u2581side", "\u2581seperator", TextCtrl,
        term, '8.2', '011', ':02', tick, anchor, rst, artners, attrOne, still, Per,
        ance, "\u2581IntegerField", ne, Mode, week, criteria, "\u2581serial", "\u2581\
          Serial", tty, USB, "\u2581baud", "\u2581'1.7.0", "\u2581transparent", OF,
        EXCEPTIONS, spring, vim, '48', '65', sleep, letter, '512', Expr, pp, "\u2581\
          frequencies", '>.', '288', '566', "\u2581\"\"\"{\"", "\u2581metacl", "\u2581\
          definitions", '[^>]*>', SQLAL, CHEM, DATABASE, "\u2581up", Own, Brand, '600',
        "\u2581900", prime, connect, notify, "\u2581rect", "\u2581picture", rect,
        clusive, "\u2581double", yourpassword, PYTHON, GG, CACHE, '1250', '://192.168.',
        ':80', FileDialog, Existing, Select, objects, io, SCRIPT, "\u2581MyUser",
        "\u2581cum", sphinx, quartz, Dll, '+|(?:', whitespace, petitive, pkt, '{5})',
        "\u2581Order", Py, Project, Scrapy, Django, Counter, TER, done, contrib, "\u2581\
          padding", '256', typ, "\u2581Row", chown, finity, Regression, nt, "\u2581\
          clip", wi, periods, rtific, "\u2581indexes", "\u2581ui", It, "\u2581digit",
        writer, "\u2581detach", "\u2581configfile", "\u2581two", ')}', dot, 10^, "\u2581\
          worksheet", Formatted, "\u2581blob", "\u2581Blob", Reader, blob, filtered,
        audio, blueprint, quick, Network, Port, '133', Check, "\u2581palette", Nums,
        peaks, problem, '4.', "\u2581FooAdmin", "\u2581\"\"\"{:0", "\u2581'2012-11-0",
        '-05', '375', ge, Char, ile, duct, '0200', /1.1, Linux, '686', rv, Gecko,
        27', "\u2581black", "\u2581flag", "\u2581sizer", sec, '0:00:2', "\u2581geo",
        "\u2581ZK", TXT, pf, include, blocks, '3.7', \"""", clipboard, "\u2581queue",
        bind, mq, direct, \\||, <>, "\u2581pad", RESET, meth, Location, ish, "\u2581\
          QMainWindow", "\u2581bounds", bins, present, ale, Barack, Obama, Bill, ate,
        pr, ize, Fi, dl, yyyy, "\u2581zz", detail, "\u2581report", encoded, "\u2581\
          '482", "\u2581'24'", "\u2581newdf", "\u2581op", gracefully, mt, patch, "\u2581\
          regplot", diff, pct, pearson, PL, scp, Dummy, "\u2581painte", "\u2581restore",
        asp, "\u2581nz", "\u2581MY", SO, TUPLE, "\u2581pkgutil", "\u2581cProfile",
        ctx, "\u2581pil", "\u2581mlab", 87', '2.9', rlim, "\u2581Open", edgecolor,
        Valid, Invalid, SETTING, '2312', "\u2581fo", REGEX, RC, "\u2581trans", "\u2581\
          inverted", alph, '\\[([^]]*)\\]', "\u2581squared", FUL, whatismyip, "\u2581\
          lxml", "\u2581DEV", "\u2581what", "\u2581PyQt", Top, "\u2581'(%", "\u2581R",
        '2.23', '*(?:', "\u2581Keys", RO, Escape, "\u2581seen", "\u2581alias", dk,
        cond, "\u2581clr", "\u2581Add", "\u2581equations", '":100', "\u2581mimetype",
        "\u2581WIN", MM, Send, door, "\u2581composite", "\u2581'200", "\u2581'400",
        llow, "\u2581\"\"\"\"", "\u2581NotImplemented", Subclasses, implement, "\u2581\
          thresh", "\u2581eliminate", "\u2581emp", Dictionary, gpio, '&&', "\u2581\
          myinst", BaseModel, '?[^', vendor, "\u2581Label", alphanumeric, States,
        "\u2581worker", "\u2581relations", relations, 0%, stored, "\u2581SIGNAL",
        finished, PyQt, PyObject, "\u2581cost", MP, MODE, "\u2581pixel", "\u2581pixels",
        "\u2581anti", declaration, 10\, AE, IO, SOME, HERE, "\u2581HTML", uzy, "\u2581\
          cast", void, "\u2581'%10", "\u2581swap", "\u2581Con", "\u2581degrees", 'ON',
        GT, streamer, tiny, CE, Editor, helv, Executing, "\u2581creation", "\u2581\
          DET", CHED, PROCESS, asdf, stream, yVar, vote, "\u2581100000", "\u2581ET",
        '33.505', "\u2581quantize", "\u2581circle", gi, scorch, dumpster, "\u2581\
          co", ship, feed, video, '}/', SQL, Asia, Kol, difference, ijkstra, Contour,
        EX, TERNAL, CHA, AP, PROX, "\u2581sales", "\u2581Out", let, "\u2581active",
        EW, NS, "\u2581histogram", '{0,3}', "\u2581interval", descendant, '"\', "\u2581\
          '1.0.", "\u2581'1.3.", Mark, marked, mytable, "\u2581wildcards", Function,
        schema, tablename, ounded, '000000.0', '0000000000000', shape, "\u2581acc",
        "\u2581weights", "\u2581BOT", 'YES', "\u2581'50'", "\u2581Author", "\u2581\
          ProductAdmin", FL, GED, '>.+)', Version, lock, LOCK, 7%9, "\u2581mymodel",
        "\u2581through", "\u2581Stock", Request, approved, '><', multipart, POST,
        '">''', Say, '"><', '></', ux, "\u2581paste", fire, SI, METHODS, "\u2581Column",
        "\u2581Integer", "\u2581Bytes", "\u2581Child", "\u2581Location", "\u2581Work",
        join, '1.56', Spring, ET, RAI, RL, "\u2581comb", "\u2581pyc", 081, 32', crypt,
        hash, He, "\u2581'2013-0", '7.2', '611', "\u2581music", "\u2581med", "\u2581\
          barplot", TA, Spam, umper, ')(?!', '(?<!', align, "\xAC", "\u2581packed",
        "\u2581mount", 'False', SomeClass, iant, "\u2581connected", component, "\u2581\
          psycopg", Binary, "\u2581Class", '+)(?=\\', bound, '[0-9]*', (...), ABCDEF,
        ancestor, nl, Active, "\u2581firefox", "\u2581180", Len, "\u2581compare",
        slots, Ui, "\u2581cities", "\u2581cons", "\u2581yy", chieve, KNOWN, alone,
        "\u2581IM", SCALE, goodbye, removed, sign, '141', mdb, uint, omb, "\u2581\
          nextSibling", "\u2581Example", "\u2581Basemap", "\u2581bounding", "\u2581\
          lon", "\u2581resolution", "\u2581mu", "\u2581Normal", mu, timeout, "\u2581\
          degree", "\u2581simulation", software, "\u2581MainWindow", Motion, "\u2581\
          go", somewhere, mar, Feed, tslib, '000000000', ns, GL, eight, "\u2581Connection",
        Pool, '6379', dims, '-20', Header, "\u2581parameters", DOWN, onMouse, Down,
        "\u2581tar", YYY, "\u2581addr", "\u2581depth", shade, gg, "\u2581tuples",
        FOO, CURRENT, robin, LOCAL, "\u2581Your", Task, "\u2581OpenClipboard", destination,
        '>{', '}</', "\u2581minidom", "\u2581parseString", "\u2581enc", SDK, "\u2581\
          vs", ass, partition, "\u2581picturetag", rmul, Article, "\u2581step", "\u2581\
          Bucket", "\u2581rects", "\u2581align", "\u2581wordList", "\u2581refresh",
        Stretch, '!!''', ')?''', pizza, "\u2581mod", '5888', '.0737', '2.96', '2492',
        '2838', '5337', Only, Spaces, Ph, rase, candidate, TK, "\u2581pkg", resources,
        distribution, "\u2581activate", 6""", Record, '00.0', vect, "\u2581corpus",
        ordinal, "\u2581bitwise", DJANGO, SETTINGS, MODULE, "\u2581lowest", thousands,
        "\u2581wa", preview, steps, "\u2581LOG", Man, bit, "\u2581schedule", "\u2581\
          1.9", FLU, LED, CAPS, ()#, ppExe, oot, "\u2581money", "\u2581tool", member,
        issue, "\u2581section", "\u2581Day", gov, violet, 28', "\u2581chars", plt,
        '...........', '................', "\u2581scores", "\u2581expr", erlin, "\u2581\
          Kill", aabbcc, Last, tv, "\u2581modify", STATE, OD, security, render, "\u2581\
          ST", '13000', "\u2581train", "\u2581strat", Document, "\u06F0\u06F1\u06F2\
          \u06F3\u06F4\u06F5\u06F6\u06F7\u06F8\u06F9", "\u2581di", ebian, "\u2581\
          strtod", '8743', '2083', '-15', SUB, CT, GM, RAW, Exemp, "\u2581Contact",
        reason, "\u2581scalar", "\u2581elt", dirty, NAT, cairo, Relay, Go, '654',
        Categories, Blastoff, "\u2581metaclass", doctor, differently, Background,
        "\u2581delta", cv, '>[\\', "\u2581'2017-01-0", added, asof, "\u2581quotes",
        "\u2581Mat", processor, "\u2581ext", dont, override, lstsq, Summary, dimensions,
        different, "\xD8", '5,', '6.8', imp, "\u2581elevation", "\u2581namespace",
        packages, Derive, "\u2581predefined", DFL, '412', '3.87', '915', "\u258120.92",
        '995', '367', '1577', '0.9', camera, man, "\u2581domain", "\u2581pydot", literal,
        "\u2581sol", "\u2581monkey", mod, "\u2581chunk", polar, Person, Boy, "\u2581\
          vertic", "\u2581remote", "\u0449", "\u2581starts", cent, paris, Paris, Method,
        '154', '465', mog, "\u2581normed", You, Sorry, "\u2581Index", "\u2581lo",
        elem, "\u2581language", "\u2581service", Win, 64-, '#3.3', quote, Oranges,
        mis, '>{0}</', "\u2581170", deprecated, USERNAME, yourfile, "\u2581edges",
        '0.8', approx, Quantile, "\u3042\u308A\u304C\u3068\u3046", 8859-, COLOR, "\u2581\
          unicode", dataframe, '3.97', "\u258110.0", "\u2581chunks", bear, "\u2581\
          ngrams", Frame, "\u2581perform", "\u2581PIL", "\u2581Has", Assembly, "\u2581\
          xlrd", workbook, export, anything, shell, Timestamp, Context, drag, "\xE4",
        "\u2581altered", VI, ko, "\u2581dig", aware, "\u2581UTC", myuser, hsv, '123.0',
        "\u2581Activation", central, "\u25812.5", "\u2581Queue", "\u2581maxsize",
        MO, MAX, LE, "\u2581sound", OUND, Command, generator, TestRunner, "\u2581\
          suite", '#25.', "\u2581allowed", Mean, "\u2581that", ingredients, Ingredient,
        "\u2581recipe", "\u2581lock", "\u2581250", qcut, propagate, mkdir, "\u2581\
          setItem", "\u2581QTableWidget", running, '!\', Step, Download, svn, isolated,
        "\u2581lib", "\u2581periodic", THIS, 'FALSE', "\u2581mechanize", "\u2581101",
        '2322', CAST, Layout, 'OFF', accelerate, acute, zorder, "\u2581keyword", "\u2581\
          Html", "\u2581accum", vfb, Xvfb, "\u2581':", tcp, aha, "\u2581leds", "\u2581\
          Number", "\u2581Lists", ame, +|$, ABLE, "\u2581interrupt", "\u2581shortest",
        agency, addr, itemnumber, '66', cubic, horizontal, chart, using, "\u2581answer",
        '#{"', adder, integer, "\u25811.1", cy, conv, "\u2581snap", "\u2581topological",
        "\xEF\xBB\xBF", pot, pro, cov, subtract, "\u2581GetWindow", "\u2581unwanted",
        BOM, "\u2581fibo", "\u2581benchmark", "\u2581prev", Previous, "\u4F60\u597D",
        mb, cs, '7.0', )\, cube, square, commit, ted, numpy, masked, "\u2581zaxis",
        "\u2581Linear", cropped, "\u2581crop", "\u2581gen", bidden, "\u2581factor",
        smok, "\u2581tips", "\u2581iso", ffic, ise, EU, animal, '712', parameter,
        optional, Default, jeff, control, live, "\u2581selected", "\u2581dosomethingelse",
        ear, Thank, tion, IMPORTS, GLOBAL, 9**9**9**9, Bay, station, trait, spawn,
        zk, 2=, ut, ord, dead, Master, (//, "\u2581ls", eek, "\u2581SEEK", CUR, Big,
        amp, Intersection, miner, 029, Power, Shell, unt, Preview, kind, "\u2581Month",
        '#{:', "\u2581lbl", vi, "\u2581prog", ips, nomial, '-17', "\u2581slow", '999999',
        Fl, Upper, cut, TAB, "\u2581myStr", "\u2581sequence", "\u2581escaped", "\u2581\
          baz", pressed, msvcrt, "\u2581pisa", "\u2581sup", whole, potion, "\u2581\
          minor", dumps, quotation, "\u2581conj", hist, ical, LAST, "\u2581enable",
        "\u2581matched", '8080', "\u2581125", "\u25810.8", "\u2581newline", "\u2581\
          weird", "\u2581dataset", Decode, strict, uniq, "\u2581three", Gene, "\u2581\
          tur", tle, "\u2581pen", "\u0B85", "\u2581SORT", ORDER, "\u2581kw", fA, "\u2581\
          arity", .7.1, Edge, TM, freevars, creator, cellvars, '{2}(?:', (.*)\\, "\u2581\
          versions", "\u2581currency", DEL, ENABLED, Late, "\u2581dis", '345', ymin,
        prev, "\u2581wr", RESULT, "\u2581lm", "\u2581lmplot", "\u2581sharex", "\u2581\
          share", "\u2581sps", light, "\u2581orig", docs, thumb, decompos, DIA, FILETYPE,
        "\u2581templates", '1990', "\u2581stock", playlists, playlist, "\u2581divide",
        board, "\u2581margins", Lower, '5.15', '531', drive, "\u2581smile", "\u2581\
          129", took, Dave, Lu, "\u2581FileField", "\u2581chrome", Options, votes,
        "\u2581expected", Enable, mypass, "\u2581RE", Menu, Left, "\u2581maxVal",
        '308', virtualenv, MyClass, "\u2581Handler", '"{0}"''', "\u2581Scale", scaled,
        "\u2581factory", AGENT, ible, twin, "\u2581cartesian", "\u2581EX", PAND, "\u2581\
          ALL", Tree, details, Equipment, '9354', Failed, "\u2581pi", boo, "\u2581\
          begin", ABL, ba, COL, rot, unknown, entities, pack, Convert, "\u25811000000",
        Warning, "\u2581Dynamic", )""", '062', "\u2581Load", Library, kernel, product,
        "\u2581replacement", '[^()]*\\)', "\u2581me", "\u2581you", nothing, "\u2581\
          43", "\u2581seaborn", rgb, baby, oop, "\u2581simultaneous", jpeg, Parse,
        padded, Year, Occurence, "\u2581RGB", Allow, pause, '621', '854', '405', Index,
        COLLECTION, joe, cg, "\u2581'2010-01-0", getframe, argcount, INFO, "\u2581\
          '0123456789", '">', Danger, Robin, son, "\u258144", NameError, cfg, "\u2581\
          abort", "\u2581'****", '*****', execute, deploy, sitemaps, LINK, MODEL,
        "\u2581wav", TkAgg, "\u2581slot", ratings, From, hm, '{:<15}', "\u2581interp",
        "\u2581prob", spain, "\u2581Sub", het, fit, "\u2581jinja", '#}}', '*(', Animation,
        screenshot, "\u2581'(?<!", In, provider, WAS, SERVE, "\u2581'\"{}\"", ffi,
        Encoder, jobs, agent, libdl, preference, byte, "\u2581digitize", DEBUG, "\u2581\
          void", OOP, "\u2581reportlab", IPAddress, '2001', ago, middle, aet, GAT,
        "\u2581Dispatch", Excel, "\u2581family", "\u2581best", Reply, '*(\\', Thu,
        July, REAM, "\u2581emit", ault, "\u2581TEXT", filterwarnings, flavor, Points,
        TO, TS, "\u2581DATABASE", "\u2581unistr", "\u039C\u03B5\u03C4\u03B1\u03BB\u03BB\
          \u03B9\u03BA\u03B1", "\u2581'^(?=.*", Tim, stupid, ADD, "\u2581De", precationWarning,
        ran, occurrence, generate, Changed, State, "\u2581pipe", Franc, "\u2581NP",
        '540', "\u2581scrapy", je, '{:03', food, tu, OOK, flag, "\u2581truncate",
        "\u2581subj", fee, "\u2581DF", "\u2581'???'", "\u2581repl", "\u2581Input",
        tWidgets, Done, cards, punctuation, "\u2581Sys", fr, card, iple, ERROR, ndog,
        "\u2581documents", progress, goes, "\u2581Color", rw, jumped, isolation, SESSION,
        TRANSACTION, ISO, LEVEL, REPEAT, Unknown, support, "\u2581zrange", Parameter,
        operator, alias, "\u2581statement", XXXX, YYYY, "\u2581dr", MySQL, lxml, nstead,
        "\u2581omit", "\u2581duplicates", pie, "\u2581DATA", ourier, mono, metros,
        equiv, "\u2581combs", uptime, "\u2581queries", release, "\u2581patches", hatch,
        tz, Fri, May, '#2009', "\u2581cython", expense, decimal, "\u2581UserProfile",
        Print, division, zero, '49', try, replacement, "\u2581wrong", "\u2581edgecolor",
        "\u25810.001", "\xED", "\u0327", layer, trick, smith, ian, '304', '#{1:',
        "\u2581samples", ()., lColor, ub, '...,', '#:)', "\u2581english", dtypes,
        "\u2581pygtk", "\u2581require", "\u2581down", Mod, '416', '493', Westminister,
        London, England, pow, REG, reg, ENTER, '123456789', "\u2581'{}:", Map, flow,
        "\u2581permissions", "\u2581Permission", Upload, "\u2581pow", '#{{', "\u2581\
          QObject", tSig, BEGIN, Bad, Access, Token, cookiejar, "\u2581'1.", logging,
        ask, representation, ey, SHORT, FORMAT, Phil, "\u2581summary", "\u2581matmul",
        Percentage, "\u2581reorder", cells, Frequency, "\u2581finder", "\u2581Callable",
        System, delitem, "\u25813.2", "\u2581subtract", "\u2581percentile", '674',
        008, "\u25810.47", "\u25812.1", pieces, '777', NLTK, working, human, written,
        Summariz, summaries, "\u2581Pagination", "\u2581shallow", (1+, "\u2581spec",
        extend, foobarbaz, Specify, step, "\u2581Interactive", Session, "\u2581JSONEncoder",
        "\u2581izip", "\u2581XML", "\u2581diffs", "\u25810.01", "\u2581Email", Range,
        bur, Johnny, ka, die, RED, "\u2581outliers", low, "\u2581GC", "\u2581clique",
        "\u2581logo", "\u2581myVariable", "\u2581myTuple", "\u2581Plural", izer, sky,
        "\u2581ipdb", "\u2581cursors", "\u2581DictCursor", "\u258110000000", lack,
        "\u2581chat", fake, importance, "\u2581Close", Minor, "\u2581conditional",
        Module, "\u2581tarfile", attributes, "\u2581expanding", apply, "\u2581Named",
        '822', Resource, "\u2581bundle", compare, messages, '-456', Customer, tainment,
        Tele, Show, usb, lp, "\u2581Append", "\u2581CPP", DEFINE, LU, VALUE, "\u2581\
          shapes", "\xD2", operation, "\u2581myObject", defined, ra, "\u2581traceback",
        "\u2581mock", wrong, '#2]}]', ++, "\u2581bulk", "\u2581qry", "\u25814.0",
        "\u25819.0", '+(?', '*(?', "\u2581pointer", quotes, "\u2581takewhile", Blue,
        disable, "\u2581custom", '0.10', '#!!', iddle, "\u2581',\\", (0), Listening,
        EED, dj, celery, Martin, "\u2581Stop", Development, SOFT, WARE, "\u2581tap",
        joy, "\u2581game", "\u2581fake", oh, succeed, "\u2581cgi", "\u2581song", "\u2581\
          Font", Helvetica, "\u258136", ^2, "\u2581122", zlim, rance, ala, xy, HA,
        '0-9.\\-]+[.]', ']{2,4}', '()<>]+|', '\\(([^\\', '()<>]+\\)))*\\)', ')+(?:\\(',
        '()\\[\\]', ',<>', "\xAB\xBB\u201C\u201D\u2018\u2019", =//, Submit, ':<25}',
        SETF, "\u2581sz", GPIO, ject, ive, away, "\u2581warning", Duration, blogg,
        "\u2581dfUnstacked", '(.+?)', ration, draw, '-]+', "\u2581inputs", abstract,
        gd, mapped, xternal, late, paste, "\u2581le", utc, frodo, desc, wo, "\u2581\
          agent", lang, aug, indian, "\u2581times", Finished, say, "\u2581blah", intermix,
        "\u2581nbin", "\u2581prune", Radi, '^{-', '}$)', "\u2581\"\"\"|", groups,
        Stuff, Doc, "\u2581dedupe", DOMAIN, "\u2581cx", GTKAgg, "\u2581records", "\u2581\
          spam", currency, "\u2581years", expon, corr, "\u2581location", "\u2581operation",
        builder, "\u2581integrate", '7244', '9999', retry, runserver, frames, cell,
        neous, graphml, Refresh, Leave, "\u2581transl", "\xF6\xDF", "\u2581natural",
        Cache, Mix, "\u2581'2016", RIGHT, cumprod, '-]+)/$', tool, NORM, SIGQUIT,
        Quantity, autoload, '4166', '875', enable, "\u2581clusters", '#{!', errno,
        "\u2581ctx", "\u2581images", '1977', Description, Beatles, '739', reduce,
        '[1]', peer, 'NO', MNO, Meta, "\u2581Save", BIT, MAP, Batch, Matrix, tif,
        Width, Delta, "\u2581translation", translations, translate, "\u2581signature",
        "\u2581prepopulate", "\u2581animals", "\u2581frames", Page, "\u2581reload",
        Whatever, "\u2581EXTENSION", spider, Fail, "\uC815\uC815", Answer, "\u2581\
          '197", ']\', "\u2581MA", CHOICE, pacific, "\u2581212", "\u2581gl", Ortho,
        "\u2581pc", stokes, PN, COM, AMA, "\u2581'<%", "\u2581property", "\u2581Di",
        Graph, "\u2581listbox", "\u2581selection", permissions, acquire, SSH, '9685',
        '939', '3377', "\u2581412", '6.77', '7.9', "\u2581Dict", "\u2581respond",
        "\u2581Paragraph", bullet, STYLE, TION, "\u2581OnMouseMo", ve, '145', "\u2581\
          AuthorForm", "\u2581pause", "\u2581chardet", "\u2581detect", Fizz, dollars,
        "\u2581Call", Me, maj, nav, Distribution, Friend, Po, cde, fghi, Missi, discover,
        "\u2581conf", "\u25810.99", COMMIT, "\u2581myFile", -09, 57', util, ease,
        Increase, "\u2581adjust", "\u2581Match", OUTPUT, myModule, explorer, pig,
        cow, dupes, OOL, Contact, codes, "\u0BAE", "\u2581pcolor", Blues, contacts,
        Exception, "\u2581prefixed", digits, means, "\u2581xi", "\u2581yi", "\u2581\
          zi", yml, "\u2581shlex", webdriver, console, ealth, '2.7182818284', "\u2581\
          css", "\u2581rotate", ru, "\u2581Soup", rrival, "\u2581avg", "\u2581mass",
        "\u2581'2000-6-1", "\u2581control", "\u2581cyc", "\u2581primary", "\u2581\
          autoincrement", SERIALIZ, serial, '"1"', '#"3"', ':4}', KEEP, LIVE, '(#[0-9]+',
        Mailbox, "\u2581SaveAs", '"])', USD, "\u2581tra", "\u2581saved", "\u2581theano",
        "\u2581phase", "\u2581fib", "\u2581centre", "\u2581App", logfile, '0100011',
        '1000011', NG, "\u25811.3", Body, Created, Expected, "\u2581mult", Scores,
        "\u2581account", "\u2581cyg", "\u2581Python", "\u2581exe", ga, hh, bak, nickname,
        "\u2581ImageDraw", "\u2581Draw", JOIN, neuter, creation, scr, internals, original,
        idle, "\u25810.333", "\u2581'{0[0]:", "\u2581kernel", Console, '(?:(?:', '{8})',
        "\u2581tensor", bbc, "\u2581lat", "\u2581codes", BAZ, +)/(, zdir, coolwarm,
        "\u2581noise", contained, "\u25816.0", ative, "\u0394", IGNORE, '01:00:00',
        '.0000', "\u2581timer", "\u2581cancel", mation, EXTRA, negative, gency, TestSuite,
        "\u2581objs", ACC, "\u25810.098", "\u25810.02", '938', Does, sense, "\u2581\
          wrapper", ipv, nine, hours, "\u2581Git", ious, touch, "\u2581tools", training,
        accuracy, "\u2581ca", '897', '61', buf, "\u2581datatype", UT, tinymce, nn,
        ib, ling, Spacing, currentframe, lotte, leston, "\u2581quot", "\u2581'\"\"",
        fp, Edit, "\u2581hivms", dollar, dialect, "\u2581mail", "\u2581libraries",
        mango, "\u2581token", Condition, Revision, "\u2581short", ADO, "\u2581dynamic",
        "\xDB", playing, Scheme, Password, "\u2581ndimage", FolderCreateBtn, "\u2581\
          '160", '779', "\u2581'159", "\u2581'161", '718', '715', '639', '637', '633',
        '525', '518', "\u2581classes", "\u2581'1/3", spec, Worker, yl, "\u2581magnitude",
        "\u2581vectors", "\u2581yticks", "\u2581may", Service, "\u2581SERV", processed,
        But, CONSOLE, Membership, angle, "\u2581GetSys", temM, etric, "\u2581incremental",
        +)(\\, needle, Scatter, "\u2581small", "\u2581sigma", '789', "\u2581locations",
        VACUUM, concatenated, parrot, "\u2581No", ggplot, duration, hocolate, ally,
        "\u2581pipeline", transform, Additional, Pair, '766', "\u2581'\"\"'", triang,
        empir, cache, Dialog, "\u258123.6", "\u2581dd", convolve, ALTER, redirect,
        Reds, PASSWORD, "\u2581MPI", raz, Times, tip, "\u043A\u0438\u0440\u0438\u043B\
          \u043B\u0438\u0447\u0435\u0441\u043A\u0438\u0439", act, "\u2581books", Sale,
        mylist, "\u2581cherry", Completed, higher, grant, "\u25815.1", oranges, HELLO,
        -0.0., '411', '683', '7000', Search, Must, "\u2581expunge", "\u2581device",
        "\u2581Import", needed, cursor, DV, "\u2581tell", "\u2581steps", bias, fat,
        sit, eating, remote, Screen, "\u2581way", incognito, Professional, "\u2581\
          types", "\u2581Module", "\u2581Extend", cts, "\u2581fragment", Non, increasing,
        matches, devel, "\u2581'{0", ':>8}', Thread, Started, RPT, STK, sales, "\u2581\
          collapse", boto, "\u2581calculate", gamma, Wo, nder, "\u2581watch", "\u2581\
          shop", "\u2581DatetimeIndex", realms, "\u2581tcp", "\u2581ipython", "\u2581\
          magic", timeit, supported, grouped, matrices, rior, "\u2581GTK", ICON, dtype,
        "\u2581itemsize", ung, ide, "\u2581Peer", "\u2581deleted", "\u2581arrow",
        ker, "\u2581PA", PAR, gyp, Control, Origin, losses, "\u2581loss", cross, entropy,
        "\u2581optimizer", "\u2581'3.14", "\u2581Super", speed, preced, ence, "\u2581\
          0.35", 049, '847', "\u2581fixed", Something, "\u25810.95", fraction, best,
        Wed, Safr, 78', getargspec, bank, ow, "\u2581dosomething", Socket, "\u2581\
          support", Oxygen, '#->', "\u2581vector", '(?,?,?,?,?,?', raised, ROW, COLUMN,
        PYTHONPATH, "\u2581QPushButton", MessageBox, "\u2581Re", Role, lie, Car, "\u2581\
          panel", "\u2581Panel", decorator, Proto, placement, "\u2581occ", NA, containing,
        ocean, sss, "\u2581router", "\u2581'9:", Por, sche, '30,000', '10,000', '200,21',
        "\u2581measure", Demo, Style, putpalette, "\u2581'{}-{}", '{}({})', validation,
        '665', '719', '549', '366', '19.8', '41.8', "\u2581'132", '511', '468', '454',
        "\u2581caps", "\u2581Elasticsearch", Quit, "\u2581deque", '210.184175597721',
        "\u2581reflect", refresh, pineapple, '(1,2,3)', ocket, Icon, ICO, really,
        uri, "\u2581equation", ero, Full, "\u2581QTableView", Week, Colour, Offset,
        "\u2581cnt", cast, exclude, ':.2', backup, UPDATE, factory, Transport, Buffer,
        Factory, apt, upgrade, Duplicates, '4.458', '.94', 08333, MON, "\u2581arguments",
        mybucket, "\u2581oct", "\u2581Send", Lorem, ipsum, dolor, consec, labor, magna,
        aliqu, veniam, nostrud, exercitation, ullamco, laboris, nisi, Except, cupi,
        ident, anim, drop, Formula, warn, hey, "\u2581bs", og, ust, speak, paragraph,
        "\u2581OneToOneField", "\u2581center", '".*?")', "\u2581features", "\u2581\
          bias", family, "\u2581Reference", '8.5', "\u2581Client", )*(, "\u2581Tool",
        stderr, "\u2581Page", Wrapper, xgboost, east, '21.7', '#26.', '21.4', '4.7',
        '29.9', '7.15', '#46.', '43.1', '46.9', '103', '105', '5.5', '2.7', '.75',
        '7.3', '2.4', '7.8', '6.5', '6.6', '9.3', '90.0', '7.4', '102.5', '4.4', 32-,
        '4518', "\u25813.4", '356', After, truncate, contain, imdb, '8778', given,
        "\u2581currentItem", "\u2581summation", "\u2603", questions, '"]]', dialog,
        "\u2581curs", NOW, REVERSE, CYAN, '\\((.*?)\\)', )(.*)(, arri, tokens, "\u2581\
          texts", "\u2581Header", '.0062', '333333333333', dic, "\u2581traversal",
        "\u2581unordered", "\u2581iterrows", "\u2581project", XML, Question, qty,
        mpg, ford, "\u2581circular", "\u2581script", underline, authorize, ck, "\u2581\
          work", '360', intro, VERB, NOUN, rench, "\u2581ends", ')[\\', recipient,
        "\u2581azim", elev, commands, Contents, argins, ModelAdmin, pat, '2.6', apanese,
        Free, manufacturer, production, "\u2581RNA", lim, sublime, except, brackets,
        "\u25810.024", tfall, '225', "\u25810.0134", '663', "\u25810.025", '373',
        '993', ane, "\u2581inline", '15:14', "\u2581ngram", Url, within, "\u0332\u0305",
        BC, toolkit, mplot, "\u2581Axes", Matplotlib, "\u2581priority", '18.3', '9.1',
        DATETIME, FAST, FA, THE, "\u2581running", '880', '47368421', Effective, MyThread,
        "\u25812.6", "\u2581This", "\u2581alt", Store, "\u2581'../../", oob, oba,
        "\u2581'%0*", chat, "\u2581maxlen", _201, CREATED, "\u2581positions", "\u2581\
          core", "\u2581wsgi", "\u2581WSGI", good, "\u2581Progress", "\u2581missing",
        ModelSerializer, '>%', 2", "\u2581placeholder", "\u2581hexbin", "\u2581storage",
        "\u2581reference", lam, esides, cleanse, recaptcha, mag, What, toolbar, "\u2581\
          em", functions, tition, unchanged, "\u2581SIGALRM", '*:\\', unittest, "\xF8\u032F\
          \u032F", JSONEncoder, "\u2581high", scores, "\u2581assertRaises", "\u2581\
          grp", beautiful, keyword, "\u2581tw", "\u2581ocean", berry, download, orcl,
        "\u258155", connected, "\u2581Aggregat", nhat, Ann, EN, "\u2581fieldname",
        getattribute, "\u2581earth", "\u2581speed", "\u2581sftp", "\u2581hdf", entered,
        environment, LING, could, found, "\u2581tokenizer", "\u2581158", '609', CHARACTER,
        character, connection, "\u2581distances", QL, PRAGMA, '670', '32793', later,
        Override, "\u2581throw", "\u2581'2008-09-", '5.4', "\u2581mkdir", "\u2581\
          inverse", "\u2581inv", "\u2581favorite", ZipFile, EVER, MAC, '9876543',
        "\u2581Fraction", "\u2581subparsers", Read, Subclass, "\u2581human", OVER,
        LOW, "\u2581launch", Without, gzip, FAS, artist, "\u2581tekstboks", "\u2581\
          211", "\u2581httpd", FFF, Banana, Too, fbuildbot, "\u2581relative", "\u2581\
          paths", fk, "\u2581combin", que, "\u2581fro", "\u2581linear", LinearRegression,
        "\u2581validate", Dataset, begin, "\u2581silent", "\u2581third", "\u2581TestCase",
        Point, coordinates, "\u258145.5", '1594', "\u2581suit", "\u2581combo", PF,
        hk, notebook, talk, expiry, Ctrl, mongodb, comparison, "\u2581Factory", "\u2581\
          uncompressed", clicked, ble, separated, INSTA, LLED, APPS, existing, lite,
        "\u2581skel", angular, "\u2581moving", "\u2581setText", samples, house, House,
        minima, Hey, ListField, "\u2581Sigma", "\u2581heatmap", "\u2581\"\"\"12345",
        AdminForm, ANT, "\u2581recv", hair, "\u2581Orange", basket, "\u2581SparkContex",
        Simple, App, "\u2581'**", Accept, Harry, "\u2581virtualenv", better, $/, hol,
        Output, KO, RD, grey, GridLayout, Work, "\u2581SSH", "\u2581Line", "\u2581\
          elapsed", "\u2581pie", "\u2581preexec", "\u2581nice", -08-1, SPECI, ES,
        "\u2581leg", Handle, "\u2581renderer", "\u2581sym", ending, RG, "\u2581QLineEdit",
        AMPLE, Export, Release, "\u2581timing", danger, "\u2581internet", END, "\u2581\
          per", caller, "\u2581Dense", "\u2581activation", edColormap, "\u2581manipula",
        ndum, ele, CAT, catalog, "\u2581separator", Modified, comes, "\u2581MyDicco",
        Sorted, "\u2581fraction", ':8080/', wireless, utils, "\u2581of", "\u2581startup",
        "\u2581START", USESHOWWINDOW, "\u2581nrows", "\u2581mvv", mvv, "\u2581Stri",
        Redis, '223', "\u2581QThread", "\u4500", "\u2581resources", "\u2581MySQL",
        Database, jonhy, mega, mirror, simple, "\u2581mouse", "\xD0\xBF\xD0\xB0",
        "\u2581po", ACGT, TATACG, symlog, "\u2581long", Require, either, "\u2581desc",
        paul, getpixel, "\u2581decorator", HOW, YOU, WORK, SW, "\u2581nb", epoch,
        "\u2581batch", '365', '138', 4\, 6\, IMAGE, "\u2581markup", NotFound, ENO,
        ubuntu, myTable, "\u2581Timeout", Stream, social, "\u2581myvar", myvar, '>\',
        AUTO, "\u2581fix", "\u2581parameter", Ok, "\u2581finding", night, "\u2581\
          disconnect", "\u2581embedding", ROUND, Erase, "\u2581bitfield", "\u2581\
          autoscale", '238', Rest, "\u2581many", smart, bounds, ython, "\u2581sender",
        "\u2581recipients", Account, verified, "\u25816.9", '032', '660254', "\u2581\
          threshold", "\u0100\u0404", expr, ABCaAA, "\u2581grequests", "\u2581hook",
        "\u2581converted", terable, '1911', '926', '2695', '135', '5234', '572', '355',
        "\u25810.0144", 08123, '77929', '6170', '8499', '4082', "\u2581cars", "\u2581\
          100.0", "\u2581netloc", qt, "\u2581Variable", weights, '7188', constructor,
        ruby, "\u2581construct", '\'':', DOB, Sun, '1997', '#13:45:00', "\u2581area",
        RI, GA, "\u2581criteria", "\u2581dll", "\u2581styles", Today, rgba, scheme,
        kde, "\u2581secondary", ach, Op, "\u2581REST", FRAME, customize, Metadata,
        club, "\u2581job", softmax, "\u2581dists", "\u2581produce", ABCD, free, getpwuid,
        oops, "\u2581fnmatch", assets, '*/*', '.....', never, pop, ulerian, "\u2581\
          capture", CaptureFromCAM, Pattern, myusername, "\u2581density", une, ig,
        ram, "\u2581Context", lashes, consecutive, forms, "\u2581box", Signal, Wave,
        dden, "\u2581polygon", "\u2581calc", known, "\u2581Dialog", "\u2581kwd", "\u2581\
          '2011-10-", "\u2581cert", ification, BOLD, sel, alchemy, baaz, "\u2581give",
        '6.3', "\u2581video", Delete, "\u2581su", Random, Gaussian, inline, Horizontal,
        "\u2581Public", "\u2581Radio", "\u25810.24", "\u2581ordering", revision, "\u2581\
          Multiple", "\u2581'10:", connector, "\u2581chords", imported, less, migration,
        star, edu, gs, "\u2581Question", "\u2581approach", someone, "\u2581assertDict",
        Equal, "\u2581problem", ike, "\u2581contours", NON, Beans, Configure, Uniform,
        sents, ABCDEFGHIJKLMNOP, QRSTUVWXYZ, 0123456789, "\u2581export", Instance,
        "\u2581itertuples", pivot, Trigger, "\u2581QAbstractItem", "\u2581wrap", "\u2581\
          expression", interface, oid, Post, elocity, np, "\u2581spinn", witch, Err,
        Clear, bmat, "\u25810.06", ood, logged, MyStruct, "\u2581delim", INIT, "\u2581\
          NULL", "\u2581xp", "\u2581120", "\u2581LoginForm", Nick, Create, air, "\u2581\
          programmer", DateTime, Pickle, "\u263A\uFE0F", mathr, "\u2581secret", ROUTER,
        router, Router, imap, '125', encoder, ircular, aptoit, '6851', loaded, "\u2581\
          sklearn", "\u2581preprocess", forget, "\u2581overlap", "\u2581finish", "\u2581\
          edit", lorem, Success, "\u2581Position", marker, "\u2581override", aBc,
        een, attachments, Equation, Surface, finite, "\u2581Select", MultipleField,
        "\u2581dropped", copie, "\u2581copie", alt, "\u2581TestSuite", "\u2581manage",
        Load, Timeout, isbn, _%, Mercedes, '%03', '0001', An, "\u2581spring", "\u2581\
          iteration", '}}!''', "\xE1\xA7", "\u2581elementwise", "\u2581dish", "\u2581\
          cru", cial, '})\\', '*$)', "\u2581solution", NUMERIC, "\u2581vertical",
        alignment, "\u2581mysql", Pixmap, alive, Axes, variance, metric, bacon, gnuplot,
        "\u2581hatch", stroke, Executable, "\u2581popt", "\u2581curve", noisy, '%07.1',
        possible, "\u2581Store", "\u25811.4", herp, derp, flights, "\u2581Game", "\u2581\
          intersections", vectorize, "\u2581oldest", frequency, '10.0', "\u25810.0001",
        "\u2581DI", "\u2581standard", "\u2581TRUE", rectangle, tagger, Figure, "\u2581\
          0.45", dmes, streak, "\u2581xls", "\u2581DB", OfNum, MESSAGE, "\u2581'300",
        continent, PLE, "\u2581cords", '006', Fred, Ben, aga, olk, "\u2581MyCustom",
        "\u2019", newline, "\u2581puy", sses, NOT, '000001', '2022', '791', "\u4EA4\u6613\
          \u91D1\u989D", "\u5143", aligned, detector, quo, Andrew, followers, "\u2581\
          workflow", "\u2581trigger", role, "\u2581role", "\u2581fail", Func, unexpected,
        "\u2581both", "\u2581glVertex", analysis, TARGET, CM, ATCH, Manager, ']:<15}{0[',
        '<5}', Or, "\u2581400", Tags, dy, '772', ':22''', computer, "\u25810.33",
        rabbit, rog, UNIQUE, ree, assembl, "\u2581children", sender, "\u2581usage",
        Any, "\u2581attachment", dupe, mm, aggregation, maker, ubsub, 192.168.1.1,
        "\u2581knap", animated, "\u2581'2.2", "\u2581authors", Process, ma, lineEdit,
        Children, cz, NY, English, "\u2581tb", notes, soft, ility, "\u2581wkt", +/-,
        digit, trends, started, formatted, "\u2581ending", mtx, "\u2581toolbar", "\u2581\
          then", '576', '699', AGT, "\u2581INSERT", varnames, portrait, "\u2581inter",
        sandwich, proba, '192', '457', protected, Site, land, aph, '45.0', '625',
        '4058', "\u2581subscribe", dec, "\u2581partitions", partner, "\u2581angle",
        "\u2581atan", alcon, "\u2581API", Second, degree, "\u2581paw", POINTER, ulong,
        "\u2581Markup", "\u2581measurement", mom, "\u2581Delete", "\u2581ellipse",
        JS, TN, '-30', "\u2581compute", "\u2581COM", "\u2581ingredients", "\u2581\
          metric", sqlalchemy, spot, "\u2581latt", SCHE, DULE, scheduler, Scheduler,
        tries, Presen, "\u2581classifier", "\u2581griddata", ':>12}', "\u2581hidden",
        "\u2581Rule", gmlLinkExtractor, "\u2581follow", Goodbye, "\u2581consecutive",
        bot, "\u2581Graph", "\u2581normalized", Get, Special, "\u2581CS", setup, trusted,
        "\u2581sl", acl, VV, "\u2581spherical", "\u2581possible", "\u2581Manager",
        screensaver, suspend, "\u2581Element", "\xC2\xA9", "\u2581signals", '640',
        lignment, "\u2581Align", Center, IT, Why, "\u2581dictConfig", conda, '({0})',
        Cosine, "\u2581tkMessageBox", "\u2581cyclic", additional, 0238, '2.39', '39847',
        "\u2581substitute", Minimum, Rate, Pause, "\u2581HIGH", "\u25818.8", Target,
        etLoggerClass, "\u2581Colored", detect, mime, '}\', "\u2581slicing", "\u2581\
          breaks", "\u2581bcrypt", salt, AMP, cascade, school, ENABLE, ARRAY, OWNDATA,
        shared, unit, "\u2581Active", Workbook, "\u2581Cells", "\u25810.0059", '7973',
        '8066', "\u2581Items", "\u2581menubar", Return, "\u2581invoke", shelf, "\u2581\
          diagonal", "\u25810.85", "\u2581Update", nul, "\u2581Gaussian", overridden,
        '6.4', '7.6', Hz, avatar, break, lineno, complete, '248', Main, "\u2581ewm",
        "\u2581classify", features, filt, cu, cau, acu, repl, Focus, "\u2581ev", "\u2581\
          Skip", "\u2581Is", "\u2581'..\\\\", unordered, '19.5', someMethod, '#{}\',
        padding, gn, "\u2581facebook", "\u2581oauth", "\u2581Execute", "\u2581commands",
        "\u2581tokens", "\u2581future", "\u2581compani", already, 'Null', "\u2581\
          symmetric", obscure, "\u2581extension", mapping, Lost, Secret, Icec, ncorporate,
        lost, ronos, Forge, ).#, Final, Prime, Exit, Strategy, fly, Arbitrator, "\u2581\
          Sprite", ibm, "\u2581Digit", "\u2581ldap", "\u2581OPT", TLS, REQUIRE, "\u2581\
          0.104", "\u2581nbytes", '{:.0', "\u2581buttons", cdef, codec, "\u2581zaxisvalues",
        facebook, "\u2581inheritance", "\u2581404", "\u2581fitness", "\u2581Un", Grade,
        voi, lin, slith, "\u258113.4", '0.123', "\u2581lot", "\u2581Duration", CAP,
        PROP, PS, relative, "\u2581ele", ':>10}', '#|"""', ']([', "\u2581'12345678",
        '34567891', Priority, "\u2581velocity", xterm, filesystem, "\u2581epoch",
        Most, UNIX, '//*[', Bold, previous, "\u2581splitter", stocks, '#(?,?,?,?,?',
        "\u2581Attribute", Build, "\u258137", '755', bench, comb, "\u25810.55", "\u2581\
          0.76", "\u2581conditions", "\u2581low", "\u2581reordered", "\u2581pois",
        Enumeration, "\u2581shapely", ops, "\u2581library", "\u2581terms", jump, MOR,
        129-, BLOB, divided, "\u2581'(.+?)\\\\1+", "\u2581checkbox", "\u2581Click",
        "\u2581Pdb", interaction, "\u2581compressed", truc, queen, zoomed, Clicked,
        "\u2581unused", "\u2581'2010-0", '657', ))""", CHOICES, '1984', "\u2581Tor",
        signal, Signup, "\u2581warpPerspective", onnie, Actual, cur, "\u2581resolve",
        thresh, '357', '358', CHANGE, RFC, PEEK, accept, Scene, "\u2581Redirect",
        monday, "\u2581Math", '263', '827', Received, MyPak, rn, "\u2581rounding",
        LF, "\u2581fromfunction", memberships, "\u2581populate", cgi, askdaosdka,
        "\u2581assignment", "\u2581OpenSSL", '509', "\u2581paragraphs", "\u2581mid",
        hance, even, clean, remind, awesomeness, "\u2581coef", LAB, Serial, ALPHA,
        yahoo, "\u2581Worksheet", "\u2581docvec", FUNC, yourapp, cyan, similar, resize,
        "\u2581ANT", IALI, insort, Inline, formset, "\u2581collat", "\u2581java",
        "\u2581formset", "\u2581maxval", FLO, EI, "\u2581uppercase", Sh, "\u2581NaN",
        "\u2581hold", "\u2581exclusion", "\u2581AWS", SECRET, einsum, "\u2581visible",
        docx, "\u2581Pump", DOG, called, "\u2581characters", tiger, roman, "\u2581\
          Address", "\u2581Value", helper, SP, occurs, "\u2581kv", Department, '873',
        "\u2581maze", octet, fxn, minus, dashes, "\u2581Yield", "\u2581'4+55+", "\u2581\
          OSError", getdents, "\u25813.1", WOR, Look, kwargs, '422837', "\u2581inset",
        WANT, "\xC0\xC1\xC2\xC3\xC4\xC5\xE0\xE1\xE2\xE3\xE4\xE5\xD2\xD3\xD4\xD5\xD6\
          \xD8\xF2\xF3\xF4\xF5\xF6\xF8\xC8\xC9\xCA\xCB\xE8\xE9\xEA\xEB\xC7\xE7\xCC\
          \xCD\xCE\xCF\xEC\xED\xEE\xEF\xD9\xDA\xDB\xDC\xF9\xFA\xFB\xFC\xFF\xD1\xF1",
        Regex, "\u2581sentences", primary, browse, MS, "\u2581Server", "\u2581WebDriver",
        Wait, met, "\u2581WS", ICK, Spectral, Need, italic, "\u2581'<(\\\\", OPTIONS,
        "\u2581greeting", Track, "\u2581Generic", dealer, algo, "\u2581algo", summary,
        "\u2581midnight", zinfo, fullscreen, doStuff, "\u2581pub", since, Entity,
        "\u2581same", direction, "\u2581QVariant", honeysuck, ypal, "\u2581board",
        vertical, "\u2581keyfunc", "\u2581gettext", solution, Flush, "\u2581Script",
        "\u2581CloseClipboard", '104', "\u2581substrings", leave, "\u2581apps", "\u2581\
          compiled", HTML, "\u2581dash", "\xE8", Login, '402', '774', "\u2581scoped",
        Elapsed, "\u2581google", Predicate, "\u2581unix", NE, Sports, MENT, pages,
        "\u2581tasks", "\u2581interleave", Helper, "\u2581millisecond", IZE, "\u2581\
          generator", "\u2581sqlalchemy", "\u2581whitespace", Values, Grand, Great,
        grand, woman, mixed, "\u2581QSize", Expanding, "\u2581sanitise", Static, "\u2581\
          constrain", "\u2581imaplib", SSL, Multi, Treeview, hoora, "\u2581dup", Playlist,
        Video, '65535', VB, calendar, "\u2581'%04", TRUNCATE, stepsize, "\u2581gdb",
        defaultdict, ubyte, Diff, "\u2581horizontal", "\u2581modern", "\u2581zope",
        setter, csr, "\u2581'<.*?>", interval, "\u2581\"\"\"__", __""", ="%, "\u2581\
          tab", "\u2581origstream", appname, downloads, "\u2581Boolean", tol, "\u2581\
          packet", "\u2581listOf", "\u2581every", lies, "\u2581case", sensitive, "\u2581\
          Contest", dimension, "\u2581pump", denom, inator, take, '480', decoration,
        hui, Right, deb, tabular, excepthook, "\u25814294967295", "\u2581tri", "\u2581\
          bug", LT, '10.6', spyder, captcha, culled, ECTION, stdin, consts, rawler,
        "\u2581'-0.0", mylogger, tel, "\u258125.9", Testing, dupl, "\u2581borders",
        BORDER, '):#', "\u2581HOST", "\u2581PORT", illegal, ranges, "\u2581iterator",
        "\u2581symbols", "\u2581own", tenant, OO, '5678', Wrong, )%, ("."), "\u2581\
          rowspan", Conc, "\u2581SM", Bus, "\u2581phi", psi, "\u2581wave", accepted,
        "\u2581predictions", '{:20}', '15.0', '25.0', '35.0', '740.0', '50.0', MacOS,
        "\u2581coeff", suds, transport, BUILD, "\u2581sphinx", PIPE, Train, "\u2581\
          learning", "\u2581submodule", Grid, "\u2581Box", Sizer, HORIZ, ONTA, minute,
        '#16#', ':00:00''', CGI, 1>', '{1,16}', "\u2581wrapped", "\u2581company",
        ABCDE, NER, runner, "\u2581Start", "\u2581broadcast", "\u2581lots", cmp, mobile,
        "\u2581ban", parallel, Fine, "\xE0", "\u2581four", "\u2581easy", "\u25818.7",
        "\u2581Trans", executor, "\u2581be", carp, ':5000', "\U00010000", "\u2581\
          scan", 2-3, airwise, Poll, referrer, "\u2581Array", "\u2581Route", forward,
        VAR, Employe, rename, ilvermoon, intergra, ontrolling, "\u2581stage", "\u2581\
          Quit", "\u2581Bar", "\u25813000", 038, "\u2581729", Dan, "\u2581Top", someurl,
        purple, "\u2581events", mk, "\u2581ScrolledWindow", President, Microsoft,
        "\u2581System", Async, "\u2581mesh", vertex, "\u2581rule", "\u2581zoom", CFLAGS,
        "\u25811072", '877', '19.9', Creating, aving, flu, paint, cancel, Mapp, Before,
        Since, Begin, ters, Would, '769', Ticks, verbose, LANGUAGE, CODE, "\u2581\
          instances", "\u2581trailing", DataFrame, "\u2581myfun", calling, '406',
        '578', '557', Usage, Decimal, Just, ified, '#%.3', "\u2581'1,2,", "\xAE",
        HH, "\u2581precision", Spider, "\u2581net", btn, "\u2581tkinter", '0361',
        "\xA6", pull, "\u2581spider", ffmpeg, Jen, '188518982.18', routine, gaussian,
        "\u2581analyse", "\u2581drawing", ']{4}-[', foreign, "\u2581Size", Rich, zier,
        "\u2581shows", Explorer, "\u2581surf", slave, Register, Using, divide, traceback,
        rduino, '9600', requirements, lation, "\u2581mocked", '905', tpl, lamp, "\u2581\
          blocks", minutes, "\u2581UUID", "\u2581rd", "\u2581Twitter", "\u2581contact",
        ciphers, SSLv, ciao, "\u2581alarm", consistent, "\u2581VER", TICAL, "\u2581\
          POS", "\u2581back", '595', maintenance, Monthly, linked, Connect, "\u2581\
          Cancel", fork, "\u2581remaining", "\u2581tqdm", "\u2581plain", ':100', "\u2581\
          gdal", greetings, '12345', gist, OrRd, seismic, Pu, pink, toppings, opping,
        TDR, '1648', '9523', '918', "\u2581higher", statement, "\u2581ordereddict",
        "\u2581Treeview", "\u2581slicer", odbc, mako, "\u2581opt", VALU, "\u2581actual",
        Limit, "\u2581pytest", "\u2581Scroll", AMV, Many, "\u2581compose", practical,
        upon, cruel, drink, Depth, dylib, "\u2581traverse", calculation, tornado,
        Hom, ography, frm, blocking, "\u2581controls", BU, "\u2581Slic", "\u2581execution",
        SSQP, '344', "\u5929\u5730\u65B9\u76CA", "\u6A29", "\u258112684", OrderedDict,
        "\u2581breakpoints", extrema, "\u2581greater", Device, "\u2581tau", "\u2581\
          prior", Yellow, Tab, '750', '4725', XMLParser, recover, "\u2581DateTime",
        grappelli, "\u2581uri", '054', '724', JAN, BDF, DD, CLOSE, "\u2581filtr",
        luck, "\u2581latex", Quota, sets, Memmap, SITE, TestCase, "\u2581typ", '861',
        det, Welcome, blo, ']*(', "\u2581memcache", "\u2581'127.0.0.", pty, Terminal,
        sliding, broadcast, incorrect, DOUBLE, BACKEND, "\u2581dns", "\u2581Gallery",
        "\u2581'{0}:", "\u2581autocomplete", mvn, compile, Holiday, "\u2581holiday",
        setting, LOADER, MIDDLEWARE, middleware, linear, ibraries, ING, "\u2581dictionaries",
        "\u258141387.7565", Watt, "\u25810.235", logout, heatmap, '19.6', Daily, "\u2581\
          deserialize", ods, "\u2581environment", "\u2581fact", Sleep, cdrecord, hack,
        "\u2581'#%02", "\u2581vbox", ',3', '%-5', knights, "\u2581tested", vtk, crawl,
        unable, determine, Predicted, Save, "\u2581'192.0.", leg, "\u2581gcs", junk,
        MonthEnd, Already, "\u2581overwrite", ypothesis, significant, "\u2581pts",
        "\u2581countries", "\u2581radio", "\u2581splitted", "\u2581operate", IE, Bee,
        ANY, Tutorial, "\u2581Permut", "\u2581ContentType", Calendar, legs, avour,
        cricket, orig, mem, protein, UI, raise, "\u2581resizable", "\u2581interface",
        '\\(''([^'']', CXX, ''',''', Mem, Events, steve, FOOBAR, UD, "\u2581QAbstract",
        '#$%', '^_`{', "\u2581factories", itting, "\u2581touch", Mathscore, Weak,
        Occurrence, '43.2', pcap, "\u2581fieldsets", "\u2581hide", GO, Computer, fj,
        jo, fer, chromosome, batch, due, substrings, Ho, "\u2581bigge", kka, (.//,
        00$, MainContent, RequestHandler, photo, neg, Energy, mytest, nexistent, Joining,
        '2006', -01-01, "\u2581even", palindrome, "\u2581JSON", "\u2581blobs", lexer,
        "\u2581changes", ization, "\u2581PdfFileReader", "\u2581middleware", Middleware,
        pointer, uld, Kernel, "\u2581special", "\u2581bash", Rectangle, heap, autoscale,
        "\u2581Eq", "\u2581art", "\u2581Poly", latest, "\u2581magical", argspec, extract,
        "\u2581CountVectorizer", standard, February, "\u25810.0002", '2048', '0.003',
        "\u25819.9", '4132', '4539', '.000', alman, exc, '100.1', PySide, "\u2581\
          Dump", "\u2581Round", Trip, "\u2581quad", 1/0, "\u2581cropped", ritish,
        tone, "\u2581predicate", "\u2581network", '937', iris, "\u2581encrypt", "\u2581\
          FTP", "\u2581route", idea, BarModelForm, wsdl, celsius, lvin, Camera, "\u2581\
          kanji", "\u2581grab", "\u2581cookielib", CookieJar, "\u2581truncated", stddev,
        Pack, SUCCESS, matching, "\u2581Beautiful", SOAP, "\u2581extensions", ole,
        initialized, morning, zipped, CL, "\u2581Cake", neo, More, "\u2581Ordered",
        Retrieve, calc, occurred, "\u2581previous", readable, "\u2581hsv", "\u2581\
          resource", '2015-04-25', Guess, Over, '15.6', Outlook, Namespace, MAPI,
        "\u2581xyc", Histogram, "\u2581cli", fabfile, fatal, QUrl, jquery, Change,
        "\u2581openpyxl", rwx, '{1,2', '}(?', '-]{1,1', ']{1,2})\\', ':]', '{4,5})',
        Initialize, "\u2581weighted", "\u2581FooForm", "\u2581logout", "\u2581Raw",
        think, "\u2581'0.00", room, "\u2581clause", "\u25811.25", Public, Pictures,
        "\u25813600", "\u2581GL", endif, "\u2581Run", authenticated, ast, compute,
        "\u2581flow", "\u2581rtf", "\u2581sliced", "\u2581Change", imag, normalize,
        Really, bel, ieve, butter, "\u2581prediction", "\u2581SetBackground", restart,
        "\u2581CreateImage", "\u044E\u0443", "\u0441\u043E", "\u0431\u0435\u0443\u0442\
          \u0438\u0444\u0443\u043B", "\u2581QGraphics", ouseMove, "\u2581OnKey", '869',
        '{:.3', oke, "\u2581daemon", "\u2581neuron", permute, "\u2581controller",
        precomputed, "\u2581bcolz", "\u2581ctable", "\u2581push", macro, "\u2581followers",
        "\u2581heap", "\u2581prompt", "\u2581retrieved", "\u2581lasagne", layers,
        Pointer, "\u2581fly", Choose, lv, LM, perfect, "\xC3\xB1", '243', '\\.?|',
        '+(?:[.', "\u2581setIcon", "\u2581cohesive", logentry, "\u2581transformation",
        "\u2581threads", ations, "\u2581configparser", "\u2581ModelAdmin", "\u2581\
          Linked", rolling, provided, ark, YlGn, stern, copper, Pastel, inter, spectral,
        Global, universe, "\u2581iterables", OPEN, POINT, Room, '8192', "\xD7\xA9\xD7",
        "\xD7\xA2\xD7", "\u2581WordNet", emmatize, "\u2581lemmatize", "\u2581signed",
        '5647', "\u2581radius", CONSTANT, etree, "\u2581character", "\u2581Comma",
        Separated, otification, Abort, Call, bulk, "\u2581bot", ottl, zoo, "\u2581\
          toggle", "\u2581filled", "\u2581sandbox", '>"', "\u2581estimate", "\u2581\
          dotted", Survived, "\u2581MethodType", domains, craig, "\u2581define", "\u2581\
          issub", "\u2581rsa", "\u2581RSA", "\u2581progress", "\u2581beta", openssl,
        BUTTON, SK, directories, inside, "\u2581receiver", xmlns, CLEAR, GREEN, Incident,
        Desc, BLAC, Vehicle, '944', '1908', "\u2581additional", "\u2581pages", pizzas,
        OtherModel, "\u2581sig", provide, "\u2581lengths", '556', '384', activate,
        pypi, '#[^,]+,', Google, Drive, "\xB6", counterpart, turn, DEC, REF, ond,
        "\u2581major", "\u2581elide", "\xC3\xA6", Unique, LOGGER, "\u2581comma", "\u2581\
          processed", "\u2581Extension", "\u2581ftplib", margin, though, Backend,
        wins, "\u2581expm", impl, "\u2581GCD", "\u2581pick", Jill, went, "\u2581curl",
        constants, NSEW, bah, stamp, DUMMY, Popup, pdflatex, amazon, friday, transparent,
        ChoiceField, "\u2581works", "\u25812009", Okay, "\u2581rendered", etForeground,
        reload, "\u2581website", Enum, Processes, "\u2581const", "\u2581cells", Problem,
        '():', '05.0', "\u2581sio", "\u2581240", precision, "\u2581pol", ret, ule,
        af, bra, Website, "\u2581unwrap", "\u2581clipboard", ient, "\u2581strange",
        boolean, anonymous, Decorator, "\u2581notebook", information, tokzr, SENT,
        eground, "\u2581Symbol", allowed, associate, '659', '1440', insertion, '],[',
        '7,8,9', Brook, KEYWORD, ION, "\u2581octave", Include, debugging, Quote, "\u2581\
          transparency", "\u2581development", "\u2581paired", '043', "\u2581ActionChains",
        usage, Fig, "\u2581fmin", estimate, Phone, bib, lex, tech, swift, utilities,
        "\u2581Cmd", exi, WIDTH, "\u2581prefixes", "\u2581Search", Simplest, Card,
        balanc, holder, FIXED, FLOAT, modify, "\u2581basic", rotation, RP, PAGE, ray,
        oct, "\u2581term", capital, MyModel, Delay, Peter, "\u2581Alpha", Raised,
        "\u2581Widget", Running, WHITE, aptain, lay, "\u2581pcap", uyer, via, "\u2581\
          New", "\u2581unq", Let, "\u2581PATH", "\u2581QString", MyContextManager,
        entity, "\u2581rules", currence, JSON, COMPRESS, allow, "\u2581Grid", Spec,
        equipment, Scale, History, "\u2581Resource", film, "\u2581Float", represente,
        "\u2581represent", ichard, vec, Plain, '([0-9', "\u2581comments", vsync, INCREMENT,
        "\u2581orm", raft, arian, passes, "\u2581JPEG", tumbl, Maybe, "\u2581problems",
        "\u0628\u06CC", BaseClass, hint, statistic, webcam, runch, "\u2581pymongo",
        DES, "\u2581twitter", ipaddress, addresses, XPath, Dispatch, saved, Logged,
        viridis, "\u2581Library", "\u2581Sin", Collection, "\u2581totalList", "\u2581\
          MONTHS", potato, "\u2581clamp", "\u2581smart", Sentence, hive, dropbox,
        meters, Three, Black, "\u2581Ba", "\u2581arith", "\u2581security", ounis,
        '754', curr, escribe, "\u2581uwsgi", "\u2581enemy", "\u2581punch", '1056',
        '6344', "\u2581note", dsd, REMAINDER, '75.0', seller, faster, getattr, fh,
        "\u2581Query", Failure, "\u2581MIMEMultipart", "\xC2\xB0", '{}\', "\u2581\
          manual", Setting, Egg, "\u2581locate", hlo, "\u2581emoji", "\U0001F680",
        Rank, ibberish, '5555', useful, "\u2581specific", storage, SPEC, "\u2581bi",
        descendents, "\u2581descendent", "\u2581Atomic", "\u2581ExcludedDate", "\u2581\
          below", "\u258115.7", "\u2581sorting", "\u25815.55682806", "\u25814.86368088",
        Base, "\u2581called", dbapi, ragma, istic, "\u2581salt", Firefox, '5280',
        "\u2581bell", "\u2581mypad", syncarr, "\u2581syncarr", "\u2581nullable", interpreter,
        side, ppearance, lifecycle, "\u2581lifecycle", wrap, Celery, responding, msk,
        "\u2581wavfile", "\u25812005", "\u2581preview", histogram, "\u2581boundaries",
        /1/, /1999, EXE, lambdify, "\u2581csrf", "\u2581meets", subprocess, "\u2581\
          Picture", irc, "\u2581Terminal", InteractiveShell, "\u2581axcl", "\u2581\
          regression", Raw, Guid, Make, overwrite, PARAM, '0000000000000000', "\u2581\
          reply", Board, "\u2581rhyme", emoticons, ainb, lein, Btn, DBNAME, "\u2581\
          jar", ansi, scope, "\u2581lisp", "\u2581wild", WP, "\u25818888", starting,
        "\u2581well", Option, editable, '50000', Craig, Edward, "\u2581tempfile",
        Temporary, "\u2581kivy", "\u2581emitte", "\u2581Record", compatible, "\u2581\
          closed", Shift, Translate, MOD, '99999999999', "\u2581copied", stylesheet,
        "\u2581verbos", "\u2581SQLAlchemy", weibull, "\u2581floc", fstat, "\u2581\
          RadioSelect", "\u2581percentage", "\u2581protocol", =>, '.03', "\u2581Enum",
        Mandel, ulate, otheticalBranch, "\u2581tgt", fourth, trawberry, sysfs, ous,
        MOUSE, EVENT, "\u2581csc", FILTER, concat, "\u2581drawco", "\u2581scene",
        NT, '033', '914', jp, natural, wood, ListCtrl, piecewise, unny, "\u2581quiver",
        sounds, "\u2581Sound", Music, till, OGG, "\u2581gradients", ifaces, "\u2581\
          QWeb", raggable, "\u2581senti", ivariate, Spline, "\u2581Browser", '1_0',
        ATTRIBUTE, cmdline, "\u2581opened", interrupt, unnamed, "\u2581dbus", trying,
        regions, subregion, increment, "\u2581Download", "\u2581Columns", '1980',
        uniform, clust, spd, '#2013', george, George, 5.255., '8.97', '@@@', mset,
        Feedback, "\u2581spark", Vertical, BoxLayout, trained, "\u2581proportion",
        Animal, Plot, sanity, "\u2581syscall", "\u2581ConfigParser", adapter, ALabSimulator,
        ALab, Net, Binding, Arg, ALabSite, sManager, "\u2581Global", JobNo, "\u2581\
          0.13", "\u2581intercept", "\u2581slope", '+(.*?)', "\u2581land", deep, '19970',
        Phantom, "\u2581compound", "\u2581Canvas", firm, '1251', Hyperlink, Identity,
        onkeypatch, "\u2581100000.0", "\u2581scientific", "\u2581verb", "\u2581graphics",
        farmers, suggestions, finish, "\u2581appengine", "\u2581PY", LR, "\u2581exceptions",
        Such, ElementException, "\u2581dialog", DTR, "\u2581multipart", hlines, DBus,
        "\u2581generate", threshold, "\u2581phrases", "\u2581backend", "\u2581shutdown",
        "\u2581tty", alternative, UIT, Reddit, tina, corner, illion, They, rotate,
        "\u2581details", "\u2581IndexError", "\u2581Win", amazing, consum, VEN, handlers,
        "\u2581greenlet", unread, slash, "\u2581'2014-03-", "\xCC", curses, atch,
        assign, "\u2581staticmethod", Loader, filled, "\u2581cumulative", "\u2581\
          lucky", "\u2581Pas", "\u2581endian", properties, hardware, thernet, structure,
        Bitmap, "\u2581jpg", "\u2581milliseconds", STARTUP, FAIL, graphic, Ferr, ari,
        "\u2581variables", flip, Cumulative, nc, final, "\u258122092256", shifted,
        "\u2581audio", anda, "\u2581zone", "\u2581Compos", Variance, Textbox, delay,
        prog, erator, sold, relu, "\u2581vowel", Versions, efinitely, CONF, MainPage,
        "\u2581KMeans", "\u2581ggplot", "\u2581Not", Nic, Oracle, '2:00', "\u2581\
          gdata", "\u2581Multi", "\u2581codepoint", fully, opencv, "\u2581Publisher",
        downloaded, arrangement, installation, decomposi, 1.6.1, 0184, "\u2581largest",
        argv, Want, "\u2581ModelSerializer", "\u2581Http", Tool, "\u2581cron", "\u2581\
          mro", Corpus, newcorpus, SIMULATION, '428571428571', resume, SyntaxError,
        '4400', Rect, '4.244', Encoding, "\u2581'3.14159265", Happy, birthday, Eggs,
        TOP, SIGN, "\u2581tests", /03/, "\u2581scrollbar", "\u2581SQL", Stack, Overflow,
        declare, CO, MAT, tile, "\u2581QV", temporary, "\u2581testing", lmost, Visit,
        Sitemap, laplace, logistic, lognorm, pare, powerlaw, gauss, validators, "\u2581\
          axins", Radiobutton, beaker, cover, "\u2581roots", Axis, mpp, "\u2581Pre",
        wallet, '172', '16.2', "\u2581onclick", MetaData, Locked, "\u2581given", ARGS,
        "\u2581Function", greater, pdb, "\u2581mfc", "\u2581deep", "\u2581truth",
        shuffle, chunk, Oops, ToString, RADIUS, "\u2581Int", htmlString, bg, Fragment,
        "\u2581fast", Turn, Mesh, wheel, '''{}''"', NAL, metadata, torrent, "\u2581\
          markers", "\u2581Split", Waiting, POINTS, Days, TextFile, "\u2581division",
        "\u2581Co", itanic, raged, listener, Shape, feedback, Gr, "\u2581perl", vectors,
        '11111111111111', neighbor, "\u25814.9", Proxy, invit, junior, nanargmax,
        malformed, CUDA, BLE, DEVICES, "\u2581gpu", "\u2581workers", "\u2581UserSerializer",
        "\u2581Factori", heads, cwd, ought, greg, "\u2581unknown", '7834', 5""", '#0)',
        "\u2581Figure", patches, interests, ootball, basketball, TextEdit, nltk, "\u2581\
          '800", eeting, '720', Silly, "\u2581sh", "\u2581twisted", "\u2581lose",
        hand, idxmin, "\u2581less", "\u2581Reshap", Logging, UU, smooth, pylons, gramma,
        ook, "\u25812016022", high, Multiple, Xml, "\u2581distutils", remainder, "\u2581\
          SyntaxError", braces, "\u2581annotation", "\u2581probability", CRA, PY,
        pilImage, Mock, Remote, Prefix, repeat, highest, pending, "\u2581triangula",
        "\u2581lzma", '4164', Organization, MONGO, Vector, "\u2581available", flush,
        "\u2581strict", "\u2581putch", ugg, "\u2581Parent", transformed, compressor,
        Constrain, ep, publish, rpc, milli, schedule, Artist, "\u2581'123456'", "\u2581\
          keypress", analytics, Pear, migrate, FMT, "\xE0\xE0", "\u2581decorated",
        Starting, '[^'']*', "\u2581textfile", "\u2581matshow", MessageTime, decorate,
        "\u2581optimal", "\u2581bold", "\u2581vari", orough, "\u2581glade", "\u2581\
          posix", pacity, "\u2581MongoClient", Pdf, anhattan, Star, regular, ology,
        involve, "\u2581GdkPixbuf", "\u2581Pixbuf", shin, somefield, "\u2581maybe",
        "\u2581neighbor", AUC, inds, "\u2581substitutions", "\u2581cmyk", CMYK, "\u2581\
          can", Continue, "\u2581Unicode", Scatterplot, Expire, "\u25810.39", '2999',
        UDP, lum, Find, '794', "\u2581mutate", placeholder, timer, "\u2581askopenfilename",
        weakref, Printing, caught, ENGINE, December, bababa, dashed, "\u2581we", testsite,
        RCVALL, '00005', Paper, Rock, Scissors, "\u2581pull", "\u2581react", Lock,
        "\u2581BOM", "\u2581Edit", "\u2581gaussian", "\u2581Single", "\u2581Feed",
        zlib, "\u2581cloud", Queue, boardInterrupt, "\u2581asyncore", Pika, closed,
        "\u2581mac", boundary, based, ctypes, ICT, "\u2581exif", kins, myzip, "\u2581\
          ml", Pipe, "\u2581QComboBox", "\u2581interruptable", "\xA1", "\u2581large",
        "\u2581choose", "\u2581Generator", '\\-]', every, "\u2581csvout", EE, gain,
        performance, rule, "\u2581brk", productId, APT, firstlineno, stacksize, Parsing,
        '021', terminated, chinese, "\u2581Mock", xlsm, '..."', "\u2581Raise", CONNECTION,
        Exiting, "\u2581discover", discovered, urn, "\u2581Lat", "\u2581'5.6", pca,
        thirdpartymodule, outside, udf, "\u2600", "\u26FF\u2700", "\u27BF", "\U0001F300",
        "\u2581arctan", "\u2581gui", Comics, "\u2581numpad", "\u2581QtWebKit", "\u2581\
          Second", Area, modname, LS, Schema, "\u2581coordinates", zxcv, Grab, inspect,
        "\u2581individual", "\u2581nest", ltitude, TEMPLATE, cipher, resp, respons,
        sburg, rq, "\u2581channels", kyo, Malt, hile, chop, "\u2581GPS", qwe, "\u2581\
          bars", "\u2581kurt", MORE, "\u2581'12.34", mssql, "\u2581pyspark", inary,
        deactivate, "\u2581Complex", PASS, extreme, hyper, gum, chy, trunc, truth,
        collide, mydb, '667', Drop, deck, hmm, "\u2581shrink", "\u015F\u011F\xFC\u0131",
        otherwise, "\u2581sizes", general, "\u2581dependency", Magic, effect, Could,
        completed, COLLATE, adaptor, Adapter, Terminating, "\u2581so", coding, '1252',
        Emb, translation, gettext, "\u2581triplet", "\u2581UPPER", "\u2581gmpy", STDERR,
        VL, "\u258179", Mouse, gtk, "\u2581FigureCanvas", "\u258118632", "\u258118651",
        ities, "\u2581sigmoid", "\u2581cam", THING, TOOL, NEL, panels, Panel, staticfiles,
        vc, vcPortion, "\u2581pronoun", "\u2581Mutable", "\u2581LOGG", "\u258113.3",
        "\u2581Tesseract", linux, popup, "\u2581hover", "\u2581suppress", CONFIG,
        "\xFC", front, thumbnail, "\u2581flattened", "\u25810.03", "\u2581observation",
        intermediate, "\u2581prof", "\u2581drive", sums, enforce, intensive, "\u2581\
          cause", loudfront, horizon, icense, "\u2581guess", "\u25810.09", actu, intersection,
        THRE, "\u2581Serializer", "\u2581Drop", BOTTOM, Gram, Hex, Irreversible, "\u2581\
          SystemExit", fold, "\xFC\xDF", "\u2581dice", validator, Validator, ept,
        made, '://127.0.0.1:', walnut, "\u2581floating", "\u25810.075", "\xF8", arity,
        rial, uiop, Hash, abacus, radius, Sock, "\u2581memoize", "\u2581WM", "\u2581\
          unpickl", david, "\u2581selectors", "\u2581xlsx", "\u2581flash", submitted,
        successfully, '''20091229', '99.0', subKey, "\u2581Concat", lint, Clipboard,
        microsecond, LinkExtractor, offline, rush, Than, "\u2581harmstat", itution,
        Writing, "\xA9", holes, '+:\\', ORIGIN, '111111111111111', Take, "\u2581readonly",
        closest, "\u2581camera", alembic, "\u2581Environment", "\u2581cr", upervisor,
        plugin, phan, rich, PROPERT, nearby, weird, "\u2581iren", Audio, "\u2581gulp",
        "\u2581live", "\u2581bitmap", GAGAGAG, GAGAGAGACAU, Asset, "\u2581MD", AVG,
        "\u2581swapped", "\u258132768", "\u2581mutable", '40000', dynamodb, demonym,
        Russia, "\u2581white", ffffff, '2013', PROTOCOL, "\u2581scope", remains, "\u2581\
          summarize", "\u2581Sequential", "\u2581Interface", truthy, "\u2581folders",
        doesnt, Pho, Made, Monday, Tuesday, "\u2581QStandardItem", pyc, aaaaaaaaaaaa,
        nsemble, estimators, "\u0304", delaunay, Triangulation, olo, suced, "\xF1",
        "\u2581formatting", "\u2581Hyp", "\u2581Vec", Changing, "\u2581HTTPS", "\u2581\
          Plan", parsing, myList, baba, "\u2581255.0", Importing, "\u2581imported",
        '/{0}', scape, "\u2581private", "\u2581wallpaper", multiplier, Layer, polygon,
        "\u2581atoms", indented, PROGRAM, failure, 0821, readonly, covered, mpeg,
        "\u2581bokeh", "\u2581plotting", atomic, "\u2581Django", submission, "\u2581\
          Word", "\xFF\xFF", lagged, interp, "\u2581PYTHONPATH", "\u2581smallest",
        "\u2581halo", "\u2581topping", America, "\u2581mahotas", penguin, Runner,
        bridge, appears, "\u2581connections", endian, logical, wise, ERR, maximum,
        "\u2581navigat", "\u2581soap", "\u2581QLabel", "\u2581noun", "\u25813.14",
        "\u2581minimize", NCE, SYSTEM, "\u0430\u0431\u0432", "\u2581semilog", ancy,
        bbox, Canvas, "\u2581Appropriate", Comment, useragent, "\u2581Crypto", "\u2581\
          heading", "\u2581older", "\u2581myText", "\u2581arc", "\u2581FORMAT", "\u2581\
          Mix", "\xC9", "\xEF", Centroid, OCK, '$10^{{', NGLE, "\u2581connectTCP",
        Closed, fifo, icrosoft, "\u2581also", "\u2581Shaped", ock, occurences, "\u2581\
          Argument", Duplicate, survey, positional, skipping, _2_2, "\u2581LEN", isco,
        "\u2581'650", spread, college, Either, Movie, '339', '644', DRIVE, BLAST,
        '#####', assemble, libxxx, unsupported, REST, '://127.0.0.1', '30000', '4,5',
        "\u2581Subclass", "\u2581blur", Exists, worksheet, "\u2581setting", Large,
        SRT, pipe, "\u2581whos", "\u2581argument", "\u2581pyximport", ota, sublist,
        BOX, "\u2581PySide", journal, "\u2581blurred", "\u2581polling", WF, tmx, XG,
        '#00:00:00''', "\u2581suggest", processing, collapse, '#1)', "\u2581upgrade",
        annotations, "\u2581see", unction, apache, "\u2581before", abundant, elif,
        deficient, parallelism, "\u25810.08", swap, "\u2581segment", "\u2581nzsum",
        "\u2581Rectangle", ual, LLOW, "\u2581Unique", olat, "\u2581xyz", funny, lade,
        "\u2581entities", "\u2581dep", Roman, "\u2581Hash", closing, "\u2581QPoint",
        '391', putpixel, fine, including, visitor, implementation, Threshold, Bala,
        tfidf, entering, Unable, "\u2581here", permutat, Slide, "\u2581WSGIScriptAlias",
        Dropbox, flask, "\u2581IOError", pixel, "\u4DFF", "\u2581Cartesian", Larry,
        stopped, "\u258174.1", "\u258174.19", "\u258174.3", "\u258174.4", "\u2581\
          rid", "\u2581Signal", '14,856', '18,554', "\u2581fold", MainWindow, "\u2581\
          ThreadPool", "\u2581who", "\u2581Tweet", "\u2581crawl", When, ':2.0', KW,
        SVR, "\u2581cp", atexit, '.732', yield, diag, "\u2581async", '?=', triangle,
        vector, "\u2581pseudocolor", breakpoint, zel, "\u2581nosetests", "\u2581Choice",
        detection, '!</', bala, "\u2581colon", "\u2581invalid", bac, Initial, DATEN,
        "\u2581potential", "\u2581rdflib", '}|{:^', execution, "\u2581methods", Called,
        SV, Cluster, "\u25813.6", "\u2581formats", arrot, amber, discard, textbox,
        userid, "\u2581mem", "\u2581divisible", teardown, "\u2581Direct", spline,
        SIGINT, "\u2581concrete", "\u2581act", selfdisgust, embarrassment, elfconsciousness,
        shamefacedness, chagrin, discomfiture, abashment, hbox, "\u2581hugeequal",
        scratch, "\u2581stemm", "\u06A9\u062A\u0627\u0628", learn, "\u2581Default",
        "\u2581'10-09-", extent, "\u25811.6", UATION, priv, memmap, complex, scalar,
        uilds, "\u2581Masked", 3/4, MINUTES, sendMessage, todos, boy, roposal, Generator,
        COPY, Beta, Language, Chop, aincharacterwrap, Zazzafooky, resolved, "\u2581\
          Do", "\u2581animation", "\u2581StopIteration", enumeration, reached, rough,
        "\u2581redraw", "\u2581weapon", "\u2581odd", "\u2581Meta", bananas, RLS, titcher,
        "\u2581clients", "\u2581adjacency", "\u2581Block", Ipsum, receive, Neue, erg,
        rett, ade, These, "\u2581question", '713', "\u2581exponent", als, "\u2581\
          over", serve, credentials, "\u2581chess", "\u2581Gradient", Optimize, winner,
        "\u2581enter", "\u2581GridSearch", scoring, "\u2581ImageSurface", "\u2581\
          kalman", separator, "\u2581uploaded", UploadedFile, "\u2581'3456", Stop,
        cStringIO, strategy, ',2002:', "\u2581opencv", Average, '5199', reactor, coupled,
        "\u2581Display", TLD, Selection, Generating, SOURCES, '9185', POSIX, doSomething,
        "\u2581sched", Polygon, "\u2581Better", "\u2581Tick", Legend, "\u2581when",
        "\u2581spaces", "\u2581iterate", Retry, Methods, "\u2581beep", '.363', "\u2581\
          3.53", Properties, zap, "\u2581Listbox", "\u2581animate", ':\\/\\/', ContextMenu,
        argparse, "\u2581myseries", "\u05D0\u05B1\u05DC\u05B9\u05D4\u05B4\u05D9\u05DD",
        "\u05D0\u05B5\u05EA", "\u05D5\u05B0\u05D0\u05B5\u05EA", "\u05D4\u05B8\u05D0\
          \u05B8\u05E8\u05B6\u05E5", mas, ntras, virt, "\u2581appended", "\u2581IPython",
        anne, '4829', "\u2581OnMouse", "\u2581tweepy", PROG, "\u2581combination",
        "\u2581Polygon", Tk, together, "\u2581confusion", utm, "\u2581Check", ipping,
        Costs, Tkinter, oracle, "\u2581ChromeDriver", "\u2581subquery", overlap, NAN,
        "\u25817.1", "\u2581Every", fortran, "\u2581increment", uthorization, Toggle,
        "\u2581continue", "\u2581sprintf", '???', Closing, oooo, attname, credential,
        ential, wanted, pure, Incorrect, "\u2581Transform", "\u2581Normalize", concord,
        mother, "\u2581'192.168.0.1", distrib, "\u2581gz", ajax, Selected, "\u2581\
          gunicorn", "\u2581Parallel", cosine, "\u2581clock", grape, minimum, availability,
        "\u2581End", "\u2581'1.2.3.", "\u2581'20130101", Local, classes, "\u2581grayscale",
        "\u2581divider", "\u2581Affine", 123456', setCo, iscussion, Classifier, estimator,
        "\u2581suds", White, categorical, Receiv, "\u2581observer", DEPTH, "\u2581\
          Stor", mkdtemp, absolutely, "\u2581accuracy", "\u2581correct", "\u2581Package",
        MATO, Trying, asdfasd, "\xFE", setuptools, "\u2581\"\"\"^(?:", "\u2581jpeg",
        roster, "\u2581subproc", "\u2581accumulation", occured, "\u2581Upload", "\u2581\
          MP", "\xC3\xA5", "\u2581etc", "\u2581leading", "\u2581fork", '376', finally,
        Canada, "\u2581palindrome", '598', Collect, '-----------#', '#-------', '---------------',
        '------------', "\u2581injected", "\u2581Constant", iteritems, finance, multiply,
        Square, "\u2581registr", "\u2581permute", '1.07', titanic, BS, "\u2581hiv",
        scii, andles, "\u2581Convert", reach, ':8000''', UUID, "\u2581identifier",
        Wheel, InlineForm, prepare, transpose, "\u2581dictonary", "\u2581gensim",
        Detect, "\u2581egg", "\u2581setter", "\u2581addresses", "\u2581gradient",
        '#12#', urvival, "\u2581Github", "\u2581Document", lok, "\u2581leave", "\u2581\
          '1450", _2_1, actual, "\u2581boolean", "\u2581Bit", converged, Compare,
        "\u2581finished", About, formula, "\u2581chained", sampling, embed, '+6',
        "\u2581Initialize", tricontour, contour, attached, "\u2581mayavi", fptr, "\u2581\
          CRLF", agger, "\u2581similarity", leaving, "\u2581plugin", "\u2581png",
        "\u2581Geo", geocode, ubble, "\u2581repository", egmentedColormap, contiguous,
        Calling, omorphic, Filtered, "\u2581bookmark", Display, LUT, "\u2581Password",
        ogra, GP, '4.8', said, "\u2581ri", lank, "\u2581virEvent", "\u2581trend",
        "\u2581gmail", Skipping, urlresolvers, parsed, understand, everything, "\u2581\
          clustermap", FS, interrupted, "\u2581cleanup", halo, "\u2581CellRenderer",
        prepared, PUT, "\u2581Curl", removing, "\u2581constants", "\u2581AES", QT,
        "\u2581there", "\u2581Channel", Analysis, accident, weak, "\u2581tray", upply,
        Protocol, iling, "\u2581band", 058, '1554', WebKit, /537.36, "\u2581Patch",
        "\u2581Decorator", "\u2581Ellipse", "\u2581thickness", "\u2581circumcent",
        "\u258168", secure, Working, "\u2581adapt", party, "\u2581visited", partit,
        urmur, "\u2581stale", "\u2581Ensur", edemption, lsxwriter, multiprocess, venue,
        "\u2581FacetGrid", Iteration, episode, "\u2581backward", "\u2581Arch", "\u2581\
          PdfFile", Callback, CKET, "\u2581Double", "\u2581equals", appropriate, "\u2581\
          '2015-0", extension, "\u2581Dictionary", "\u2581Proxy", manti, ssa, Delivery,
        Generate, perform, "\u2581false", "\u2581Sequence", "\u2581Logistic", Ignore,
        preferred, descriptor, alarm, "\u2581Apple", MQ, "\u2581corner", Should, MOUNT,
        "\u2581prime", "\u2581reduceByKey", removable, "\u2581multiple", formatting,
        "\u2581Zip", closure, sequences, "\u2581obtain", "\u2581Pi", uploaded, nclusion,
        navigation, "\u2581Gui", "\u2581ingredient", permission, "\u25812.4", "\u2581\
          scons", sunroof, warranty, '1073741', dropped, "\u2581foreign", "\u2581\
          criterion", subreg, "\u2581enum", experiment, "\u2581Audio", Segment, "\u2581\
          StopAdminForm", enumerate, implemented, "\u2581Option", "\u2581explain",
        ambdas, -8859-, nsgesamt, weighted, Robot, popular, 1%8, Arch, Inverse, "\u2581\
          '2011-01-", Force, unpickle, Topic, KT, "\xC2\xAE", Copy, signin, "\u2581\
          Sign", "\u2581updated", "\u2581sampleip", ElementTree, "\u2581integr", "\u2581\
          upsert", "\u2581roles", ampaignID, "\u2581tfidf", signed, pdfgen, "\u2581\
          pika", suite, theme, '8957', "\u2581Error", "\u2581macro", relation, anurag,
        soon, "\u2581rounded", paginated, follows, "\u2581Scrollbar", reversal, Five,
        computation, "\u2581shelve", coherent, HDFStore, corpora, tire, Programming,
        SPRING, "\u2581diagram", ':8080''', cultural, "\u2581based", Sniff, "\u2581\
          sniff", ather, postgres, AV, GAAAAAGUAUGCAAGA, Norm, duplicate, actually,
        "\u2581'2345", "\u2581spectr", '3585', '6010', "\u2581closest", "\u2581later",
        APIC, Flag, Related, '#########', VU, "\u2581front", "\u2581loglog", hibern,
        "\u2581units", PRIV, MSG, "\u2581chan", leraar, "\u2581recursion", "\u2581\
          650.0", ategorical, "\u5DE5", "\u2581Tabular", EPL, "\u2581shared", "\u2581\
          Embed", ature, "\u2581interleaved", MDB, vowel, msi, MI, Building, KF, KYZ,
        LK, EFN, "\u2581thr", wwi, andor, '29101', PRO, decreasing, "\u2581Ad", wind,
        Glad, branch, Maki, "\u2581NA", rivers, algorithm, "\u2581let", "\u2581particle",
        achieve, travel, '()]*?\\', tcl, "\u2581Login", "\u2581General", Activate,
        "\u2581dependencies", IDLE, "\u2581modul", international, "\u2581grad", fresh,
        "\u2581face", Mail, "\u2581transition", mapper, syntax, Iterate, Locale, "\u2581\
          freeze", mousePressEvent, Station, "\u2581Cell", "\u2581enums", FreeTDS,
        =<, "\u2581pathlib", Patch, inserted, "\u2581esc", "\uD55C\uAE00", crop, "\u2581\
          2007", passphrase, "\u2581interpreter", privileges, "\u2581Fib", pproach,
        AAAAAAAAAAAA, exposed, EnvironmentP, Decision, Making, StandardCostingP, Reporting,
        "\u2581declarative", ADDRESS, unescaped, road, "\u2581SS", Suite, "\u2581\
          triangle", SPN, "\u2581strategies", "\u2581gif", "\u10E2\u10D4\u10E1\u10E2",
        "\u2581Inline", "\u2581checksum", LOB, Correct, "\u2581whole", wch, "\u2581\
          off", "\u2581LD", conscience, Extended, Dock, GB, Handling, Awesome, "\u2581\
          competit", Trie, "\u2581xmlrpclib", ServerProxy, "\u2581Slice", "\u2581\
          jsonpickle", stopping, '8859_', "\u2581matrices", Expand, MULTI, PoolExecutor,
        lphabetical, "\u2581basis", "\u2581encodings", loadmat, escaped, "\u2581Recursive",
        Also, Possible, whether, eind, lokaal, vak, "\u2581filehandler", Username,
        "\u2581Filter", "\u2581confused", '#%}', printable, Ignoring, uxiliary, "\u2581\
          others", "\u2581PROXYTYPE", "\u2581EmailMessage", "\u2581Nested", "\u2581\
          Hyperlinked", "\u2581association", associati, sports, '|%-1', particular,
        "\u2581spiders", "\u2581Crawl", delimiter, ersandeinweisung, Closest, "\u2581\
          canonical", "\u2581around", Shutdown, "\u2581underscore", "\u2581svg", omg,
        "\u2581Case", "\u258181.70", "\u2581eigenvector", "\u2581Cipher", Conn, '#01/01/2016,',
        '7261824,87163118', diomatic, werkzeug, GBP, "\u2581earl", /1/201, animation,
        "\u2581half", "\u2581SOAP", "\u2581recarray", "\u2581vim", "\u2581Setting",
        "\u2581disassembl", '0.130', '----------------', handling, "\u2581Sqlite",
        signature, Quarter, "\u2581mini", Authentication, "\u2581Connect", idirectional,
        "\u2581fitted", "\u2581diam", "\u2581highlight", docstring, Information, FB,
        ffle, "\u2581consumer", Break, Computing, coverage, "\u2581Render", '>>>',
        "\u2581QPainter", neighbour, "\u2581divisor", "\u2581factors", ghost, "\u2581\
          Desi", Greater, business, takes, '#10:34:', '7248', locatable, recall, EIAoOs,
        mond, "\u2581universal", Recommende, Encrypted, "\u2581QNetwork", iterparse,
        "\u2581DOC", nergy, "\u2581minimal", "\u2581duplicate", "\u2581hdlr", "\u2581\
          overlay", Memory, udcd, Vec, "\u0645\u0627", "\u0628\u0631\u0627\u06CC",
        "\u0648\u0644\u06CC", "\u067E\u0631\u062F\u0627\u0632\u0634\u060C", "\u062C\u062F\
          \u0627", "\u0628\u0647\u062A\u0631", "\u0646\u06CC\u0633\u062A\u061F", epository,
        "\u2581fixture", "\u2581QText", "\u2581Two", "\u2581EOF", '#\\\\\\\\', "\u2581\
          confirm", "\u2581public", "\u2581shortcut", eployment, Slow, sentences,
        '72399', communication, ties, "\u2581fancy", indention, aking, "\u25810.272",
        "\u2581jointplot", gona, "\u2581matlab", maximized, )...., separating, queries,
        virtual, VIRTUAL, concordance, "\u2581Service", Framework, "\u2581clos", "\u2581\
          known", 0508, Returning, gpx, unified, '8987', '94931', atel, "\u2581Nearest",
        mpf, "\u2581machine", "\u2581Duplicate", "\u2581charts", RSA, '0020041', CONTINU,
        Twenty, "\u2581successive", "\u2581PythonMagick", "\u05D1\u05BC\u05B0\u05E8\
          \u05B5\u05D0\u05E9\u05C1\u05B4\u05D9\u05EA", "\u05D1\u05BC\u05B8\u05E8\u05B8\
          \u05D0", '9535', '3857', '086137773096960,', "\u2581Support", crumbs, "\u2581\
          TfidfVectorizer", "\u2581paws", "\u2581placeholders", ocsp, DTD, ferred,
        '#19.050', bush, cactus, '!,', sharing, "\u2581MU", "\u2581layer", "\u2581\
          bytestream", Increasing, "\u2581Brace", DEACTIVATION, '#+0000",', '"],',
        "\u2581inside", phrases, KeyError, "\u2581xmltodict", Joy, WORKER, "\u2581\
          abstract", "\u2581localized", galleries, Albert, NIF, Friendship, ianSearchView,
        OnlineService, trkpt, "\u05D4\u05B7\u05E9\u05BC\u05C1\u05B8\u05DE\u05B7\u05D9\
          \u05B4\u05DD", '#%}<', flatpage, '#}}''>', <unk>]
      sentencepiece_vocab: false
      vocab_file: null
  truncate_dec_batches: false
name: annotmined
preproc: !PreprocRunner
  overwrite: false
  tasks:
  - !PreprocTokenize
    in_files: [conala-corpus/conala-trainnodev+mined.intent, conala-corpus/conala-trainnodev+mined.snippet,
      conala-corpus/conala-dev.intent, conala-corpus/conala-dev.snippet, conala-corpus/conala-test.intent,
      conala-corpus/conala-test.snippet]
    out_files: [conala-corpus/conala-trainnodev+mined.tmspm16000.intent, conala-corpus/conala-trainnodev+mined.tmspm16000.snippet,
      conala-corpus/conala-dev.tmspm16000.intent, conala-corpus/conala-dev.tmspm16000.snippet,
      conala-corpus/conala-test.tmspm16000.intent, conala-corpus/conala-test.tmspm16000.snippet]
    specs:
    - filenum: all
      tokenizers:
      - !SentencepieceTokenizer
        decode_extra_options: null
        encode_extra_options: null
        hard_vocab_limit: true
        model_prefix: conala-corpus/conala-trainnodev+mined.tmspm16000.spm
        model_type: unigram
        output_format: piece
        overwrite: false
        train_files: [conala-corpus/conala-trainnodev+mined.intent, conala-corpus/conala-trainnodev+mined.snippet]
        vocab_size: 16000
  - !PreprocVocab
    in_files: [conala-corpus/conala-trainnodev+mined.tmspm16000.intent, conala-corpus/conala-trainnodev+mined.tmspm16000.snippet]
    out_files: [conala-corpus/conala-trainnodev+mined.tmspm16000.intent.vocab, conala-corpus/conala-trainnodev+mined.tmspm16000.snippet.vocab]
    specs:
    - filenum: all
      filters:
      - !VocabFiltererFreq {min_freq: 2}
random_search_report: null
status: null
train: !SimpleTrainingRegimen
  batcher: !WordSrcBatcher {avg_batch_size: 64, break_ties_randomly: true, pad_src_to_multiple: 1,
    words_per_batch: null}
  commandline_args: *id001
  dev_combinator: null
  dev_every: 0
  dev_tasks:
  - !AccuracyEvalTask
    desc: null
    eval_metrics: bleu
    hyp_file: !SavedFormatString {unformatted_value: 'results/{EXP}.dev.hyp', value: results/annotmined.dev.hyp}
    inference: null
    model: !Ref {default: 1928437192847, name: null, path: model}
    ref_file: conala-corpus/conala-dev.snippet
    src_file: conala-corpus/conala-dev.tmspm16000.intent
  - !LossEvalTask
    batcher: !Ref {default: 1928437192847, name: null, path: train.batcher}
    desc: null
    loss_calculator: !MLELoss {}
    loss_comb_method: sum
    max_num_sents: null
    max_src_len: null
    max_trg_len: null
    model: !Ref {default: 1928437192847, name: null, path: model}
    ref_file: conala-corpus/conala-dev.tmspm16000.snippet
    src_file: conala-corpus/conala-dev.tmspm16000.intent
  dev_zero: false
  initial_patience: null
  loss_calculator: !MLELoss {}
  loss_comb_method: sum
  lr_decay: 0.5
  lr_decay_times: 3
  max_num_train_sents: null
  max_src_len: null
  max_trg_len: null
  model: !Ref {default: 1928437192847, name: null, path: model}
  name: !SavedFormatString {unformatted_value: '{EXP}', value: annotmined}
  patience: 3
  reload_command: null
  restart_trainer: true
  run_for_epochs: 30
  sample_train_sents: null
  src_file: conala-corpus/conala-trainnodev+mined.tmspm16000.intent
  trainer: !AdamTrainer {alpha: 0.001, beta_1: 0.9, beta_2: 0.999, eps: 1.0e-08, skip_noisy: false}
  trg_file: conala-corpus/conala-trainnodev+mined.tmspm16000.snippet
  update_every: 1
