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
    """Update Target and Source list of ada link step
    
    remove the b~ prefix for target
    adds .adb file for source
    """
    # retrieve link builder
    bndBld = env.get_builder('AdaBind')
    target = [re.sub(bndBld.get_prefix(env), '', str(target[0]))]
    source.append(re.sub(bndBld.get_suffix(env), '.ads', str(source[0])))
    #target = [re.sub(bndBld.get_suffix(env), '', str(target[0]))]
    return target, source

# Generate action for linker
def generate_link_ada(target, source, env, for_signature):
    """Generate action for linker builder"""
    return env.subst('$ADALINK') + " " + str(target[0])

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
                 src_suffix='.adb',
                 emitter = emitter_link
                 )

def ada_program(env, source):
    #lnkBld(bndBld(cmpBld(source)))
    p = env.AdaLink(env.AdaBind(env.AdaCompile(source)))
    return p

# Ada environment
envAda = Environment(BUILDERS = {'AdaCompile' : cmpAda,
                                 'AdaBind' : bndAda,
                                 'AdaLink' : lnkAda,
                                 },
                     ADACOMP = 'gcc',
                     ADALINK = 'gnatlink',
                     ADABIND = 'gnatbind')
envAda.AddMethod(ada_program, 'AdaProgram')


envAda.AdaProgram('hello.adb')

envAda.AdaProgram('yourage.adb')

envAda.AdaProgram('operations.adb')

envAda.AdaProgram('opdiv.adb')

envAda.AdaProgram('circle.adb')

envAda.AdaProgram('letter.adb')
