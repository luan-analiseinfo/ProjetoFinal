package br.com.project.checkskills.controllers.autenticacao;

import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ViewScoped;

import org.apache.log4j.Logger;
import org.primefaces.event.SelectEvent;

import br.com.project.checkskills.entities.autenticacao.UsuarioEntity;
import br.com.project.checkskills.repositories.autenticacao.IUsuarioRepository;
import br.com.project.checkskills.user.UserMB;
import br.com.project.checkskills.utils.FacesUtil;

@ManagedBean(name="usuarioBean")
@ViewScoped
public class UsuarioBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static final Logger LOGGER = Logger.getLogger(UsuarioBean.class);

	@ManagedProperty(value="#{usuarioRepository}")
	private IUsuarioRepository usuarioRepository;
	
	
	private List<UsuarioEntity> usuarios;
	
	@ManagedProperty(value="#{usuarioEntity}")
	private UsuarioEntity usuarioEntity;
	
	
	private Long id;
	
	
	//carregar lista
	public void onLoad(){
		this.usuarios = this.usuarioRepository.findAll();
	}

	//salvar ou atualizar
	
	public void salvarOuDeletar(){
		if(this.usuarioEntity != null){
			if(this.usuarioEntity.getId() == null)
			//add
			this.usuarioRepository.save(getUsuarioEntity());
		}else {
			//atualizar
			this.usuarioRepository.save(getUsuarioEntity());
		}
				
	}
	
	public void loadCadastro(){
		try {
			String valor = FacesUtil.getParam("usercod");
			if (valor != null) {
				Long codigo = Long.parseLong(valor);
				usuarioEntity = new UsuarioEntity();
				usuarioEntity = this.usuarioRepository.findById(codigo);
				LOGGER.info(usuarioEntity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//botão cancelar
	public String cancel() {
		this.setUsuarioEntity(null);
		return "/pages/usuario/usuarioList.xhtml?faces-redirect=true";
	}
	
	
	//botão adicionar
	public String add(){
		this.usuarioEntity = null;
		return "/pages/usuario/usuarioAddEdit.xhtml?faces-redirect=true";
	}
	
	//botão editar
		public String editar(){
			return "/pages/usuario/usuarioAddEdit.xhtml?faces-redirect=true";
		}
		
		public String excluir(){
			return "/pages/usuario/usuarioAddEdit.xhtml?faces-redirect=true";
		}
		
		
		
	
	//todos get e set
	public IUsuarioRepository getUsuarioRepository() {
		return usuarioRepository;
	}


	public void setUsuarioRepository(IUsuarioRepository usuarioRepository) {
		this.usuarioRepository = usuarioRepository;
	}


	public List<UsuarioEntity> getUsuarios() {
		return usuarios;
	}


	public void setUsuarios(List<UsuarioEntity> usuarios) {
		this.usuarios = usuarios;
	}


	public UsuarioEntity getUsuarioEntity() {
		return usuarioEntity;
	}


	public void setUsuarioEntity(UsuarioEntity usuarioEntity) {
		this.usuarioEntity = usuarioEntity;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	
	
}
