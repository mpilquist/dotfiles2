interp.load.plugin.ivy("org.spire-math" %% "kind-projector" % "0.9.7")
interp.configureCompiler(_.settings.YpartialUnification.value = true)
interp.repositories() += MavenRepository("https://oss.sonatype.org/content/repositories/snapshots")
