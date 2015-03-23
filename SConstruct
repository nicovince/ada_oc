import subprocess
import re
import sys

def generate_compile_ada(target, source, env, for_signature):
    """Generator for ada compilation builder"""
    return env.subst('$ADACOMP') + " -c " + str(source[0])

def generate_bind_ada(target, source, env, for_signature):
    """Generator for ada bind builder"""
    return env.subst('$ADABIND') + " " + re.sub(env.get_builder('AdaBind').get_src_suffix(env), '', str(source[0]))

def emitter_compile(target, source, env):
    """Update Target list of compilation step

    Ada compilation produces .o and .ali
    """
    cmpBld = env.get_builder('AdaCompile')
    target.append(re.sub(cmpBld.get_suffix(env), '.o', str(target[0])))
    return target, source

def emitter_bind(target, source, env):
    """Update Target list of ada bind step
    
    adds b~<target>.ads file
    """
    bndBld = env.get_builder('AdaBind')
    target.append(re.sub(bndBld.get_suffix(env), '.ads', str(target[0])))
    return target, source

# target for link is the executable name
def emitter_link(target, source, env):
    """Updater Target list of ada link step
    
    remove the b~ prefix
    """
    # retrieve link builder
    bndBld = env.get_builder('AdaBind')
    target = [re.sub(bndBld.get_prefix(env), '', str(target[0]))]
    #target = [re.sub(bndBld.get_suffix(env), '', str(target[0]))]
    return target, source

def generate_link_ada(target, source, env, for_signature):
    return env.subst('$ADALINK') + " " + str(target[0])
# Compile ada sources and link to build target
def compile_ada(target, source, env):
    for s in source:
        print "--> " + env.subst('$ADACOMP') + " -c " + str(s)
        cmdLine = [env.subst('$ADACOMP'),
                   "-c",
                   str(s)]
        job = subprocess.check_call(cmdLine,
                                    stdout=sys.stdout,
                                    stderr=sys.stderr)
    # bind
    cmdLine = [env.subst('$ADABIND'), str(target[0])]
    job = subprocess.check_call(cmdLine,
                                stdout=sys.stdout,
                                stderr=sys.stderr)

    # link
    cmdLine = [env.subst('$ADALINK'), str(target[0])]
    job = subprocess.check_call(cmdLine,
                                stdout=sys.stdout,
                                stderr=sys.stderr)
    return None

bldAda = Builder(action=compile_ada,
                 suffix='',
                 src_suffix='.adb')

# Ada Builder
cmpAda = Builder(generator=generate_compile_ada,
                 suffix='.ali',
                 src_suffix='.adb',
                 emitter = emitter_compile)

bndAda = Builder(generator=generate_bind_ada,
                 suffix='.adb',
                 prefix='b~',
                 src_suffix='.ali',
                 emitter = emitter_bind
                 )

lnkAda = Builder(generator=generate_link_ada,
                 suffix='',
                 src_suffix='.ads',
                 emitter = emitter_link
                 )
# Ada environment
envAda = Environment(BUILDERS = {'AdaProgram' : bldAda,
                                 'AdaCompile' : cmpAda,
                                 'AdaBind' : bndAda,
                                 'AdaLink' : lnkAda,},
                     ADACOMP = 'gcc',
                     ADALINK = 'gnatlink',
                     ADABIND = 'gnatbind')

#envAda.AdaProgram('hello.adb')
envAda.AdaCompile('hello.adb')
envAda.AdaBind('hello.ali')
envAda.AdaLink('b~hello.adb')
