import bpy
op = bpy.context.active_operator

op.filepath = '/home/govi/Proyects/Blender/Characters/Male_Muscular/Shorts_ML.fbx'
op.use_selection = True
op.use_active_collection = False
op.global_scale = 1.0
op.apply_unit_scale = True
op.apply_scale_options = 'FBX_SCALE_NONE'
op.use_space_transform = True
op.bake_space_transform = True
op.object_types = {'MESH'}
op.use_mesh_modifiers = False
op.use_mesh_modifiers_render = True
op.mesh_smooth_type = 'OFF'
op.use_subsurf = False
op.use_mesh_edges = False
op.use_tspace = True
op.use_custom_props = False
op.add_leaf_bones = False
op.primary_bone_axis = 'Y'
op.secondary_bone_axis = 'X'
op.use_armature_deform_only = False
op.armature_nodetype = 'NULL'
op.bake_anim = True
op.bake_anim_use_all_bones = False
op.bake_anim_use_nla_strips = False
op.bake_anim_use_all_actions = False
op.bake_anim_force_startend_keying = True
op.bake_anim_step = 1.0
op.bake_anim_simplify_factor = 1.0
op.path_mode = 'AUTO'
op.embed_textures = True
op.batch_mode = 'OFF'
op.use_batch_own_dir = True
op.axis_forward = '-Z'
op.axis_up = 'Y'
